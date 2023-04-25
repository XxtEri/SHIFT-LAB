//
//  SignUpScreenPresenter.swift
//  SHIFT-LAB
//
//  Created by Елена on 24.04.2023.
//

import UIKit

class SignUpScreenPresenter {
    
    private var view: SignUpScreenViewControllerProtocol?
    private var router: SignUpScreenRouterProtocol
    private var interactor: SignUpScreenInteractorProtocol
    
    init(router: SignUpScreenRouterProtocol, interactor: SignUpScreenInteractorProtocol) {
        self.router = router
        self.interactor = interactor
    }
    
    func setView(view: SignUpScreenViewControllerProtocol) {
        self.view = view
    }
}

extension SignUpScreenPresenter: SignUpScreenPresenterProtocol {
    
}
