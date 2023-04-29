//
//  SignUpScreenViewController.swift
//  SHIFT-LAB
//
//  Created by Елена on 24.04.2023.
//

import UIKit

final class SignUpScreenViewController: UIViewController {
    
    //- MARK: Private properties
    
    private var ui: SignUpScreenView
    var presenter: SignUpScreenPresenterProtocol
    
    
    //- MARK: Inits
    
    init(presenter: SignUpScreenPresenterProtocol) {
        self.presenter = presenter
        
        ui = SignUpScreenView()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //- MARK: Lifecycle
    
    override func loadView() {
        self.view = ui
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupToHideKeyboardOnTapOnView()
        
        handler()
    }
}


private extension SignUpScreenViewController {
    func handler() {
        ui.authButtonPressed = { [ weak self ] user in
            guard let self = self else { return }
            
            self.presenter.signUp(user: user)
        }
        
        ui.editedTextFieldHandler = { [ weak self ] user in
            guard let self = self else { return }
            
            self.presenter.checkValidData(user)
        }
    }
}

private extension SignUpScreenViewController {
    func setupToHideKeyboardOnTapOnView() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard(sender:)))
        
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    @objc
    func dismissKeyboard(sender: AnyObject) {
        self.view.endEditing(true)
    }
}

extension SignUpScreenViewController: SignUpScreenViewControllerProtocol {

    func setEnabledButton(enable: Bool) {
        ui.setEnabledButton(enabled: enable)
    }
    
    func changeLayoutAuthButton(validData: Bool) {
        ui.changeLayoutAuthButton(validData: validData)
    }
    
    func showErrorMessages(errorMessages: [String]) {
        var errors = String()
        
        errorMessages.forEach { message in
            errors.append("\n" + message + "\n")
        }
        
        let alertController = UIAlertController(title: "Внимание!", message: errors, preferredStyle: .alert)
        let action = UIAlertAction(title: "Закрыть", style: .cancel) { action in
            self.setEnabledButton(enable: true)
        }
        
        alertController.addAction(action)
        alertController.view.tintColor = .accentColorApplication
        
        self.present(alertController, animated: true, completion: nil)
    }
}
