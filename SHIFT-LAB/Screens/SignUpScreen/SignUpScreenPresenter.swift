//
//  SignUpScreenPresenter.swift
//  SHIFT-LAB
//
//  Created by Елена on 24.04.2023.
//

import UIKit

class SignUpScreenPresenter {
    
    weak var view: SignUpScreenViewControllerProtocol?
    var router: SignUpScreenRouterProtocol
    var interactor: SignUpScreenInteractorProtocol
    
    init(router: SignUpScreenRouterProtocol, interactor: SignUpScreenInteractorProtocol) {
        self.router = router
        self.interactor = interactor
    }
    
    func setView(view: SignUpScreenViewController) {
        self.view = view
    }
}

extension SignUpScreenPresenter: SignUpScreenPresenterProtocol {
    func signUp(user: UserRegisterModel) {
        interactor.signUp(user: user)
    }
    
    func checkNotEmptyFieldsData(_ data: UserRegisterModel) -> Bool {
        if interactor.checkValidData(data) {
            return true
        }
        
        return false
    }
    
    func successfullRegistration() {
        view?.turnOnEnabledButton()
        router.goToMainScreen()
    }
    
    func setErrorMessages(errorMessages: [String]) {
        view?.showErrorMessages(errorMessages: errorMessages)
    }
}
