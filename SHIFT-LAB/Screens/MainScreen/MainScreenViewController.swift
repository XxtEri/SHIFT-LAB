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
    
    
    //- MARK: Inits
    
    init() {
        self.ui = MainScreenView()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
