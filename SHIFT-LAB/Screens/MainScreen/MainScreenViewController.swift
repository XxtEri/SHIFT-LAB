//
//  MainScreenViewController.swift
//  SHIFT-LAB
//
//  Created by Елена on 24.04.2023.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    //- MARK: Private properties
    
    private var ui: MainScreenView
    
    private enum Metrics {
        static let itemsInRow = 2
        
        static let viewInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        static let insets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        static let lineSpace: CGFloat = 20
        static let itemSpace: CGFloat = 23
    }
    
    
    //- MARK: Inits
    
    init() {
        self.ui = MainScreenView()
        
        super.init(nibName: nil, bundle: nil)
        
        self.ui.configureCollectionDelegates(delegate: self, dataSource: self)
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
    }
}


//- MARK: Public extensions

//- MARK: UICollectionViewDataSource

extension MainScreenViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainScreenCompetitionCollectionViewCell.reuseIdentifier, for: indexPath) as? MainScreenCompetitionCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configureCell()
        
        return cell
    }
    
    
}

//- MARK: UICollectionViewDelegate

extension MainScreenViewController: UICollectionViewDelegate {
    
}

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
