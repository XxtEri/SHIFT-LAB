//
//  MainScreenRouter.swift
//  SHIFT-LAB
//
//  Created by Елена on 24.04.2023.
//

import Foundation

class MainScreenRouter {
    private var goToSignUpScreenHandler: (() -> Void)?
    
    init (goToSignUpScreenHandler: (() -> Void)?) {
        self.goToSignUpScreenHandler = goToSignUpScreenHandler
    }
}

extension MainScreenRouter: MainScreenRouterProtocol {
    func goToSignUpScreen() {
        goToSignUpScreenHandler?()
    }
}
