//
//  ScreenFactoryProtocol.swift
//  SHIFT-LAB
//
//  Created by Елена on 25.04.2023.
//

import UIKit

protocol ScreenFactoryProtocol {
    func makeSignUpScreen(with parameters: SignUpScreenAssembly.Parameters) -> UIViewController
    func makeMainScreen(with parameters: MainScreenAssembly.Parameters) -> UIViewController
}
