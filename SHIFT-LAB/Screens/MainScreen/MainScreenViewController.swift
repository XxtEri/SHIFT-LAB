//
//  MainScreenViewController.swift
//  SHIFT-LAB
//
//  Created by Елена on 24.04.2023.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    //- MARK: Private properties
    
    private enum Metrics {
        static let itemsInRow = 2
        
        static let viewInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        static let insets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        static let lineSpace: CGFloat = 15
        static let itemSpace: CGFloat = 23
    }
    
    private var ui: MainScreenView
    
    
    //- MARK: Public properties
    
    var presenter: MainScreenPresenterProtocol
    var competitions = [CompetitionModel]()
    var logoutCompletionHandler: (() -> Void)?
    
    //- MARK: Inits
    
    init(presenter: MainScreenPresenterProtocol) {
        self.presenter = presenter
        ui = MainScreenView()
        
        super.init(nibName: nil, bundle: nil)
        
        ui.configureCollectionDelegates(delegate: self, dataSource: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //- MARK: Lifecycle
    
    override func loadView() {
        self.view = ui
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        handler()
        presenter.loadCompetition()
    }
    
    func showAllert(title: String, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Закрыть", style: .cancel)
        
        if message == nil {
            let logout = UIAlertAction(title: "Выход", style: .default) { _ in
                self.logoutCompletionHandler?()
            }
            
            alertController.addAction(logout)
        }
        
        alertController.addAction(action)
        alertController.view.tintColor = .accentColorApplication
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func reloadData() {
        ui.reloadData()
    }
}


//- MARK: Private extensions

private extension MainScreenViewController {
    func handler() {
        ui.greetingButtonCompletionHandler = { [ weak self ] in
            guard let self = self else { return }
            
            self.presenter.greetingButtonPressed()
        }
        
        logoutCompletionHandler = { [ weak self ] in
            guard let self = self else { return }
            
            self.presenter.logout()
        }
    }
}


//- MARK: Public extensions

extension MainScreenViewController: MainScreenViewControllerProtocol {
    func showInfoUser(userName: String) {
        showAllert(title: "Привет, \(userName)!", message: nil)
    }
    
    func showErrorMessage(errorMessage: String) {
        showAllert(title: "Внимание", message: errorMessage)
    }
    
    func sendCompetition(_ competitions: [CompetitionModel]) {
        self.competitions = competitions
        reloadData()
    }
}


//- MARK: UICollectionViewDataSource

extension MainScreenViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        competitions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainScreenCompetitionCollectionViewCell.reuseIdentifier, for: indexPath) as? MainScreenCompetitionCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configureCell(with: competitions[indexPath.row])
        
        return cell
    }
}


//- MARK: UICollectionViewDelegate

extension MainScreenViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let url = URL(string: competitions[indexPath.row].url) {
            UIApplication.shared.open(url)
        }
    }
}


//- MARK: UICollectionViewDelegateFlowLayout

extension MainScreenViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath ) -> CGSize {
        
        let sideInsets = (Metrics.insets.left + Metrics.viewInsets.left) * 2
        let insetsSum = Metrics.itemSpace * (CGFloat(Metrics.itemsInRow) - 1) + sideInsets
        let otherSpace = collectionView.frame.width - insetsSum
        let cellWidth = otherSpace / CGFloat(Metrics.itemsInRow)
        
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        Metrics.insets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        Metrics.itemSpace
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        Metrics.lineSpace
    }

}
