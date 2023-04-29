//
//  SignUpScreenInteractorProtocol.swift
//  SHIFT-LAB
//
//  Created by Елена on 25.04.2023.
//

import Foundation

protocol SignUpScreenInteractorProtocol {
    var presenter: SignUpScreenPresenterProtocol? { get set }
    
    func signUp(user: UserRegisterModel)
    func checkValidData(_ data: UserRegisterModel) -> Bool
}
