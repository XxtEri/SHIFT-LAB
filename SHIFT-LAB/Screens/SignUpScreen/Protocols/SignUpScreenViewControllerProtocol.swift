//
//  SignUpScreenViewControllerProtocol.swift
//  SHIFT-LAB
//
//  Created by Елена on 25.04.2023.
//

import Foundation

protocol SignUpScreenViewControllerProtocol: AnyObject {
    var presenter: SignUpScreenPresenterProtocol { get set }
    
    func setEnabledButton(enable: Bool)
    func showErrorMessages(errorMessages: [String])
    func changeLayoutAuthButton(validData: Bool)
}
