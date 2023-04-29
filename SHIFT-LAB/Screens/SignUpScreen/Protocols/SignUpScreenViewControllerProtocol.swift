//
//  SignUpScreenViewControllerProtocol.swift
//  SHIFT-LAB
//
//  Created by Елена on 25.04.2023.
//

import Foundation

protocol SignUpScreenViewControllerProtocol: AnyObject {
    var presenter: SignUpScreenPresenterProtocol { get set }
    
    func turnOnEnabledButton()
    func showErrorMessages(errorMessages: [String])
}
