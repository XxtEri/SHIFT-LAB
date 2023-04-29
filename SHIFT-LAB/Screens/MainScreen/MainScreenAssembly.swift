//
//  MainScreenAssembly.swift
//  SHIFT-LAB
//
//  Created by Елена on 24.04.2023.
//

import UIKit

class MainScreenAssembly {
    struct Parameters {
        let completionHandler: (() -> Void)
    }
    
    static func build(with parameters: Parameters) -> UIViewController {
        let router = MainScreenRouter(goToSignUpScreenHandler: parameters.completionHandler)
        let interactor = MainScreenInteractor()
        let presenter = MainScreenPresenter(router: router, interactor: interactor)
        let viewController = MainScreenViewController(presenter: presenter)
        
        interactor.presenter = presenter
        presenter.view = viewController
        
        return viewController
    }
}
