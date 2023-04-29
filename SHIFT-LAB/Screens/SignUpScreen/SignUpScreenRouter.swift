//
//  SignUpScreenRouter.swift
//  SHIFT-LAB
//
//  Created by Елена on 24.04.2023.
//

import Foundation

class SignUpScreenRouter {
    private var goToMainScreenHandler: (() -> Void)?
    
    init (goToMainScreenHandler: (() -> Void)?) {
        self.goToMainScreenHandler = goToMainScreenHandler
    }
}

extension SignUpScreenRouter:SignUpScreenRouterProtocol{
    func goToMainScreen() {
        goToMainScreenHandler?()
    }
}
