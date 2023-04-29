//
//  MainScreenViewControllerProtocol.swift
//  SHIFT-LAB
//
//  Created by Елена on 29.04.2023.
//

import Foundation

protocol MainScreenViewControllerProtocol: AnyObject {
    var presenter: MainScreenPresenterProtocol { get set }
    
    func showInfoUser(userName: String)
    func showErrorMessage(errorMessage: String)
}
