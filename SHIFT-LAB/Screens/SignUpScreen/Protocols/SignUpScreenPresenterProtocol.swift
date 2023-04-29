//
//  SignUpScreenPresenterProtocol.swift
//  SHIFT-LAB
//
//  Created by Елена on 25.04.2023.
//

import Foundation

protocol SignUpScreenPresenterProtocol: AnyObject {
    var view: SignUpScreenViewControllerProtocol? { get set }
    var router: SignUpScreenRouterProtocol { get set }
    var interactor: SignUpScreenInteractorProtocol { get set }
    
    func signUp(user: UserRegisterModel)
    func setErrorMessages(errorMessages: [String])
}
