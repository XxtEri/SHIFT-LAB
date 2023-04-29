//
//  MainScreenCollectionViewCell.swift
//  SHIFT-LAB
//
//  Created by Елена on 24.04.2023.
//

import UIKit
import SnapKit

class MainScreenCompetitionCollectionViewCell: UICollectionViewCell {
    
    //- MARK: Private properties
    private enum Metrics {
        
    }

    private lazy var titleCompetition: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "SFProText-Regular", size: 14)
        view.attributedText = NSAttributedString(string: String(), attributes: [.kern: -0.41])
        view.textColor = .white
        view.numberOfLines = .max
        view.textAlignment = .left
        
        return view
    }()
    
    private lazy var timeCompetition: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "SFProText-Regular", size: 10)
        view.attributedText = NSAttributedString(string: String(), attributes: [.kern: -0.41])
        view.textColor = .white
        view.textAlignment = .left
        
        return view
    }()
    
    private lazy var line: UIButton = {
         let view = UIButton()
        view.backgroundColor = .lineDisscusionScreen
         
         return view
     }()
    
    
    //- MARK: Public properties
    
    static let reuseIdentifier = "MainScreenCompetitionCollectionViewCell"
    
    
    //- MARK: Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(titleCompetition)
        self.addSubview(timeCompetition)
        self.addSubview(line)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //- MARK: Public methods
    
    func configureCell(with model: CompetitionModel) {
        titleCompetition.text = model.name
        timeCompetition.text = "\(model.startTime) - \(model.endTime)"
    }
}


//- MARK: Private extensions

private extension MainScreenCompetitionCollectionViewCell {
    
    //- MARK: Setup
    
    func setup() {
        configureConstraints()
    }
    
    func configureConstraints() {
        titleCompetition.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
        }
        
        timeCompetition.snp.makeConstraints { make in
            make.top.equalTo(titleCompetition.snp.bottom).inset(15)
            make.horizontalEdges.equalTo(titleCompetition.snp.horizontalEdges)
        }
        
        line.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview().inset(30)
            make.top.equalTo(timeCompetition.snp.bottom).inset(-10)
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
    }
}
