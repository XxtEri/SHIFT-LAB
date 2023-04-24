//
//  UICustomTextField.swift
//  SHIFT-LAB
//
//  Created by Елена on 24.04.2023.
//

import UIKit

class UICustomTextField: UITextField {
    
    //- MARK: Public properties
    
    var padding = UIEdgeInsets(top: 13, left: 16, bottom: 13, right: 16)
    
    
    //- MARK: Override methods
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    
    //- MARK: Public methods
    
    func getCustomTextField(placeholder: String, isSecured: Bool) -> UICustomTextField {
        
        let view = UICustomTextField()
        view.textColor = .textTextField
        view.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        view.isSecureTextEntry = isSecured
        
        view.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.textTextField])
        
        view.layer.cornerRadius = 4
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.borderTextField.cgColor
        
        return view
    }
}

