//
//  MainRouter.swift
//  SHIFT-LAB
//
//  Created by Елена on 25.04.2023.
//

import UIKit

class MainRouter: MainRouterProtocol {
    
    private let screenFactory: ScreenFactoryProtocol
    private var navigationController: UINavigationController?
    
    init(screenFactory: ScreenFactoryProtocol) {
        self.screenFactory = screenFactory
    }
    
    func start() -> UINavigationController {
        let completionHandler = { [weak self] in
            guard let self = self else { return }
            
            self.showMainScreen()
        }
        
        let parameters = SignUpScreenAssembly.Parameters(completionHandler: completionHandler)
        let startVC = screenFactory.makeSignUpScreen(with: parameters)
        let navigationController = UINavigationController(rootViewController: startVC)
        
        self.navigationController = navigationController
        
        return navigationController
    }
}

private extension MainRouter {
    func showMainScreen() {
        
    }
}
