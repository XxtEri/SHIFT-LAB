//
//  SignUpScreenViewController.swift
//  SHIFT-LAB
//
//  Created by Елена on 24.04.2023.
//

import UIKit

final class SignUpScreenViewController: UIViewController {
    
    //- MARK: Private properties
    
    private var ui: SignUpScreenView
    
    
    //- MARK: Inits
    
    init() {
        self.ui = SignUpScreenView()
        
        super.init(nibName: nil, bundle: nil)
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
        // Do any additional setup after loading the view.
    }


}

