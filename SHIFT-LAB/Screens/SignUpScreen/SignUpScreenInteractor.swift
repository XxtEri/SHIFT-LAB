//
//  SignUpScreenInteractor.swift
//  SHIFT-LAB
//
//  Created by Елена on 24.04.2023.
//

import Foundation

class SignUpScreenInteractor {
    
    private let validator: AuthScreenValidator
    weak var presenter: SignUpScreenPresenterProtocol?
    
    init() {
        validator = AuthScreenValidator()
    }
    
    private func checkErrorValidData(_ data: UserRegisterModel) throws -> [String] {
        var errorMesssages = [String]()
        
        do {
            try validator.checkValidFistname(data.firstName)
            
        } catch AuthScreenError.emptyFieldFirstName {
            errorMesssages.append(AuthScreenError.emptyFieldFirstName.rawValue)
        }
        
        do {
            try validator.checkValidLastname(data.lastName)
            
        } catch AuthScreenError.emptyFieldLastName {
            errorMesssages.append(AuthScreenError.emptyFieldLastName.rawValue)
            
        } catch AuthScreenError.notValidExpressionLastName {
            errorMesssages.append(AuthScreenError.notValidExpressionLastName.rawValue)
        }
        
        do {
            try validator.checkValidBirthdate(data.birthdate)
        } catch AuthScreenError.emptyFieldBirthdate {
            errorMesssages.append(AuthScreenError.emptyFieldBirthdate.rawValue)
        }
        
        do {
            try validator.checkValidPassword(data.password)
            
        } catch AuthScreenError.emptyFieldPassword {
            errorMesssages.append(AuthScreenError.emptyFieldPassword.rawValue)
            
        } catch AuthScreenError.notValidPasswordCountSymbol {
            errorMesssages.append(AuthScreenError.notValidPasswordCountSymbol.rawValue)
            
        } catch AuthScreenError.notValidPassword {
            errorMesssages.append(AuthScreenError.notValidPassword.rawValue)
            
        }
        
        if errorMesssages.isEmpty {
            do {
                try validator.checkValidConfirmPassword(data.confirmPassword)
            } catch AuthScreenError.emptyFieldConfirmPassword {
                errorMesssages.append(AuthScreenError.emptyFieldConfirmPassword.rawValue)
            }
        }
        
        if errorMesssages.isEmpty {
            do {
                try validator.checkMatchPasswords(password: data.password, confirmPassword: data.confirmPassword)
                
            } catch AuthScreenError.isNotMatchPassword {
                errorMesssages.append(AuthScreenError.isNotMatchPassword.rawValue)
            }
        }
        
        return errorMesssages
    }
    
    func setPresenter(presenter: SignUpScreenPresenter) {
        self.presenter = presenter
    }
}

extension SignUpScreenInteractor: SignUpScreenInteractorProtocol {
    func signUp(user: UserRegisterModel) {
        guard let errorsMessages = try? checkErrorValidData(user) else { return }
        
        if errorsMessages.isEmpty {
            UserDefaults.standard.set("\(user.lastName) \(user.firstName)", forKey: "nameUser")
            presenter?.successfullRegistration()
            
            return
        }
        
        presenter?.setErrorMessages(errorMessages: errorsMessages)
    }
    
    func checkValidData(_ data: UserRegisterModel) -> Bool {
        if data.lastName.isEmpty ||
            data.firstName.isEmpty ||
            data.password.isEmpty ||
            data.confirmPassword.isEmpty ||
            data.birthdate.isEmpty {
            
            return false
        }
        
        return true
    }
}
