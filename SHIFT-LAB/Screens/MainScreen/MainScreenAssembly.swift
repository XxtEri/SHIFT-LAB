//
//  MainScreenAssembly.swift
//  SHIFT-LAB
//
//  Created by Елена on 24.04.2023.
//

import UIKit

class MainScreenAssembly {
    
    static func build() -> UIViewController {
        let router = MainScreenRouter()
        let interactor = MainScreenInteractor()
        let presenter = MainScreenPresenter(router: router, interactor: interactor)
        let viewController = MainScreenViewController(presenter: presenter)
        
        interactor.presenter = presenter
        presenter.view = viewController
        
        return viewController
    }
}
