//
//  AuthScreenValidator.swift
//  SHIFT-LAB
//
//  Created by Елена on 25.04.2023.
//

import Foundation

class AuthScreenValidator {
    
    func checkValidFistname(_ firstname: String) throws {
        if firstname.isEmpty {
            throw AuthScreenError.emptyFieldFirstName
        }
    }
    
    func checkValidLastname(_ lastname: String) throws {
        if lastname.isEmpty {
            throw AuthScreenError.emptyFieldLastName
        }
        
        if lastname.count < 2 {
            throw AuthScreenError.notValidExpressionLastName
        }
    }
    
    func checkValidBirthdate(_ birthdate: String) throws {
        if birthdate.isEmpty {
            throw AuthScreenError.emptyFieldBirthdate
        }
    }
    
    func checkValidPassword(_ password: String) throws {
        if password.isEmpty {
            throw AuthScreenError.emptyFieldPassword
        }
        
        if password.count < 6 {
            throw AuthScreenError.notValidPasswordCountSymbol
        }
        
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", "^[A-Z0-9]{6,}$")

        if !passwordPredicate.evaluate(with: password) {
            throw AuthScreenError.notValidPassword
        }
    }
    
    func checkValidConfirmPassword(_ confirmPassword: String) throws {
        if confirmPassword.isEmpty {
            throw AuthScreenError.emptyFieldConfirmPassword
        }
    }
    
    func checkMatchPasswords(password: String, confirmPassword: String) throws {
        if password != confirmPassword {
            throw AuthScreenError.isNotMatchPassword
        }
    }
}
