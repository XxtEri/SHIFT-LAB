//
//  SignUpScreenAssembly.swift
//  SHIFT-LAB
//
//  Created by Елена on 24.04.2023.
//

import UIKit

enum SignUpScreenAssembly {
    struct Parameters {
        let completionHandler: (() -> Void)
    }
    
    static func build(with parameters: Parameters) -> UIViewController {
        let router = SignUpScreenRouter(goToMainScreenHandler: parameters.completionHandler)
        let interactor = SignUpScreenInteractor()
        let presenter = SignUpScreenPresenter(router: router, interactor: interactor)
        let viewController = SignUpScreenViewController(presenter: presenter)
        
        interactor.setPresenter(presenter: presenter)
        presenter.setView(view: viewController)
        
        return viewController
    }
}
