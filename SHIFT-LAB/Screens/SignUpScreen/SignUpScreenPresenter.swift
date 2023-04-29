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
    
    func checkNotEmptyFieldsData(_ data: UserRegisterModel) -> Bool {
        if interactor.checkValidData(data) {
            return true
        }
        
        return false
    }
}

extension SignUpScreenPresenter: SignUpScreenPresenterProtocol {
    func signUp(user: UserRegisterModel) {
        view?.setEnabledButton(enable: false)
        interactor.signUp(user: user)
    }
    
    func checkValidData(_ data: UserRegisterModel) {
        let isValidData = checkNotEmptyFieldsData(data)
        
        view?.setEnabledButton(enable: isValidData)
        view?.changeLayoutAuthButton(validData: isValidData)
    }
    
    func successfullRegistration() {
        view?.setEnabledButton(enable: true)
        router.goToMainScreen()
    }
    
    func setErrorMessages(errorMessages: [String]) {
        view?.showErrorMessages(errorMessages: errorMessages)
    }
}
