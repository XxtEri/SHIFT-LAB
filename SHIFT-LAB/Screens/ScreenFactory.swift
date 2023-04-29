//
//  ScreenFactory.swift
//  SHIFT-LAB
//
//  Created by Елена on 25.04.2023.
//

import UIKit

final class ScreenFactory {

}

extension ScreenFactory: ScreenFactoryProtocol {
    func makeSignUpScreen(with parameters: SignUpScreenAssembly.Parameters) -> UIViewController {
        return SignUpScreenAssembly.build(with: parameters)
    }
    
    func makeMainScreen(with parameters: MainScreenAssembly.Parameters) -> UIViewController {
        return MainScreenAssembly.build(with: parameters)
    }
}
