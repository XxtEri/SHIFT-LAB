//
//  MainScreenView.swift
//  SHIFT-LAB
//
//  Created by Елена on 24.04.2023.
//

import UIKit
import SnapKit

class MainScreenView: UIView {
    
    //- MARK: Private properties
    
    private enum Metrics {
        
    }
    
    private lazy var titleScreenLabel: UILabel = {
        let label = UILabel()
        label.text = "Конкурсы"
        label.font = UIFont(name: "SFProText-Medium", size: 26)
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var greetingButton: UIButton = {
        let button = UIButton()
        button.setTitle("Приветствие", for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProText-Medium", size: 16)
        button.backgroundColor = .accentColorApplication
        button.contentEdgeInsets = UIEdgeInsets(top: 6, left: 10, bottom: 6, right: 10)
        button.layer.cornerRadius = 4
        
        return button
    }()
    
    private lazy var competitionCollectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        
        collection.register(MainScreenCompetitionCollectionViewCell.self, forCellWithReuseIdentifier: MainScreenCompetitionCollectionViewCell.reuseIdentifier)
        collection.backgroundColor = .backgroundApplication
        
        return collection
    }()

    
    //- MARK: Public properties
    
    var greetingButtonCompletionHandler: (() -> Void)?
    
    
    //- MARK: Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(titleScreenLabel)
        self.addSubview(greetingButton)
        self.addSubview(competitionCollectionView)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //- MARK: Public methods
    
    func configureCollectionDelegates(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        competitionCollectionView.delegate = delegate
        competitionCollectionView.dataSource = dataSource
    }
}


//- MARK: Private extensions

private extension MainScreenView {
    
    //- MARK: Setup
    
    func setup() {
        configureUI()
        configureConstraints()
        configureActions()
    }
    
    func configureUI() {
        self.backgroundColor = .backgroundApplication
    }
    
    func configureConstraints() {
        titleScreenLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(15)
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).inset(20)
            
        }
        
        greetingButton.snp.makeConstraints { make in
            make.centerY.equalTo(titleScreenLabel.snp.centerY)
            make.trailing.equalToSuperview().inset(15)
            make.leading.greaterThanOrEqualTo(titleScreenLabel.snp.trailing).inset(-10)
        }
        
        competitionCollectionView.snp.makeConstraints { make in
            make.top.equalTo(titleScreenLabel.snp.bottom).inset(-25)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).inset(10)
        }
    }
    
    func configureActions() {
        greetingButton.addTarget(self, action: #selector(greetingButtonPressed), for: .touchUpInside)
    }
    
    
    //- MARK: Actions
    @objc
    private func greetingButtonPressed() {
        greetingButtonCompletionHandler?()
    }
}
