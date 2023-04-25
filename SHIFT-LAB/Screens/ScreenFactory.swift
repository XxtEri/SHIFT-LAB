//
//  ScreenFactory.swift
//  SHIFT-LAB
//
//  Created by Елена on 25.04.2023.
//

import UIKit

final class ScreenFactory: ScreenFactoryProtocol {
    
    func makeSignUpScreen(with parameters: SignUpScreenAssembly.Parameters) -> UIViewController {
        return SignUpScreenAssembly.build(with: parameters)
    }
}
