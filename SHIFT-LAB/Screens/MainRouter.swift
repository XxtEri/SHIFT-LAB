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
        let nameUser = UserDefaults.standard.string(forKey: "nameUser")
        
        let startVC = nameUser == nil ? startOnSignUpScreen() : startOnMainScreen()
        let navigationController = UINavigationController(rootViewController: startVC)
        
        self.navigationController = navigationController
        
        return navigationController
    }
}

private extension MainRouter {
    func startOnSignUpScreen() -> UIViewController {
        let completionHandler = { [weak self] in
            guard let self = self else { return }
            
            self.showMainScreen()
        }
        
        let parameters = SignUpScreenAssembly.Parameters(completionHandler: completionHandler)
        let vc = screenFactory.makeSignUpScreen(with: parameters)
        
        return vc
    }
    
    func startOnMainScreen() -> UIViewController {
        let vc = screenFactory.makeMainScreen()
        
        return vc
    }
    
    func showMainScreen() {
        let vc = screenFactory.makeMainScreen()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        navigationController?.pushViewController(vc, animated: true)
    }
}
