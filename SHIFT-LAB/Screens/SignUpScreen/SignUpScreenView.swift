//
//  SignUpScreenView.swift
//  SHIFT-LAB
//
//  Created by Елена on 24.04.2023.
//

import UIKit
import SnapKit

final class SignUpScreenView: UIView {
    
    //- MARK: Private properties
    
    private enum Metrics {
        static let spacingStack: CGFloat = 16
        
        static let buttonCornerRadius: CGFloat = 4
        static let buttonsBorderWidth: CGFloat = 1
        
        static let authButtonEdgeInsets = UIEdgeInsets(top: 13, left: 10, bottom: 13, right: 10)
        static let changeAuthScreenButtonEdgeInsets = UIEdgeInsets(top: 13, left: 10, bottom: 13, right: 10)
        
        static let imageLogoTopInset: CGFloat = UIScreen.main.bounds.height * 3 / 100
        static let imageLogoLeadingInset: CGFloat = 86
        static let imageLogoTrailingInset: CGFloat = 82
        static let imageLogoBottomInset: CGFloat = -5
        
        static let infoStackHorizontalInset: CGFloat = 16
        static let infoStackTopInset: CGFloat = -44
        static let infoStackBottomInset: CGFloat = -23
        
        static let authButtonLeadingInset: CGFloat = 17
        static let authButtonTrailingInset: CGFloat = 16
        static let authButtonTopInset: CGFloat = -20
        
        static let changeAuthScreenButtonLeadingInset: CGFloat = 17
        static let changeAuthScreenButtonTrailingInset: CGFloat = 16
        static let changeAuthScreenButtonTopInset: CGFloat = -16
        static let changeAuthScreenButtonBottomInset = 44
    }
    
    private lazy var imageLogo: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "LogoApplication")
        view.contentMode = .scaleAspectFit
            
        return view
    }()
    
    private lazy var infoStack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = Metrics.spacingStack
        
        return view
    }()

    private lazy var firstNameInputField: UICustomTextField = {
        var view = UICustomTextField()
        view = view.getCustomTextField(placeholder: "Имя", isSecured: false)
            
        return view
    }()
    
    private lazy var lastNameInputField: UICustomTextField = {
        var view = UICustomTextField()
        view = view.getCustomTextField(placeholder: "Фамилия", isSecured: false)
            
        return view
    }()
    
    private lazy var birthdateInputField: UICustomTextField = {
        var view = UICustomTextField()
        view = view.getCustomTextField(placeholder: "Дата рождения", isSecured: false)
            
        return view
    }()
    
    private let datePicker = UIDatePicker()
    
    private lazy var passwordInputField: UICustomTextField = {
        var view = UICustomTextField()
        view = view.getCustomTextField(placeholder: "Пароль", isSecured: true)

        return view
    }()
    
    private lazy var confirmPasswordInputField: UICustomTextField = {
        var view = UICustomTextField()
        view = view.getCustomTextField(placeholder: "Повторите пароль", isSecured: true)

        return view
    }()
        
    private lazy var authButton: UIButton = {
        let view = UIButton()
        view.layer.cornerRadius = Metrics.buttonCornerRadius
        view.layer.borderWidth = Metrics.buttonsBorderWidth
        view.layer.borderWidth = Metrics.buttonsBorderWidth
        view.layer.borderColor = UIColor.accentColorApplication.cgColor
        view.backgroundColor = .clear
        view.contentEdgeInsets = Metrics.authButtonEdgeInsets
        
        view.setTitle("Зарегистрироваться", for: .normal)
        view.setTitleColor(.white, for: .normal)
            
        return view
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        
        indicator.color = .accentColorApplication
        indicator.hidesWhenStopped = true
        
        return indicator
    }()
    
    
    //- MARK: Public properties
    
    var authButtonPressed: ((UserRegisterModel) -> Void)?
    var editedTextFieldHandler: ((UserRegisterModel) -> Void)?
    
    
    //- MARK: Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(imageLogo)
        self.addSubview(infoStack)
        self.addSubview(authButton)
        self.addSubview(activityIndicator)
        
        infoStack.addArrangedSubview(firstNameInputField)
        infoStack.addArrangedSubview(lastNameInputField)
        infoStack.addArrangedSubview(birthdateInputField)
        infoStack.addArrangedSubview(passwordInputField)
        infoStack.addArrangedSubview(confirmPasswordInputField)
        
        configureDatePicker()
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //- MARK: Private methods
    
    private func createToolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        doneButton.tintColor = .accentColorApplication
        toolbar.setItems([doneButton], animated: true)
        
        return toolbar
    }
    
    private func configureDatePicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        
        birthdateInputField.textAlignment = .left
        birthdateInputField.inputView = datePicker
        birthdateInputField.inputAccessoryView = createToolbar()
    }
    
    @objc
    private func donePressed() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        self.birthdateInputField.text = dateFormatter.string(from: datePicker.date)
        self.endEditing(true)
    }
    
    
    //- MARK: Public methods
    
    func setEnabledButton(enabled: Bool) {
        authButton.isEnabled = enabled
    }
    
    func changeLayoutAuthButton(validData: Bool) {
        if !validData {
            authButton.layer.borderWidth = Metrics.buttonsBorderWidth
            authButton.layer.borderColor = UIColor.accentColorApplication.cgColor
            authButton.backgroundColor = .clear
            
        } else {
            authButton.layer.borderWidth = 0
            authButton.layer.borderColor = nil
            authButton.backgroundColor = .accentColorApplication
        }
    }
}


//- MARK: Private extensions

private extension SignUpScreenView {
    
    //- MARK: Setup
    
    func setup() {
        configureUIView()
        configureConstraints()
        configureAction()
    }
    
    func configureUIView() {
        self.backgroundColor = .backgroundApplication
    }
    
    func configureConstraints() {
        activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        imageLogo.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).inset(Metrics.imageLogoTopInset)
            make.leading.equalToSuperview().inset(Metrics.imageLogoLeadingInset)
            make.trailing.equalToSuperview().inset(Metrics.imageLogoTrailingInset)
            make.height.equalTo(200)
            make.width.equalTo(294)
        }
        
        infoStack.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(Metrics.infoStackHorizontalInset)
            make.top.equalTo(imageLogo.snp.bottom).inset(Metrics.infoStackTopInset)
        }
        
        authButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(Metrics.authButtonLeadingInset)
            make.trailing.equalToSuperview().inset(Metrics.authButtonTrailingInset)
            make.top.greaterThanOrEqualTo(infoStack.snp.bottom).inset(Metrics.authButtonTopInset)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).inset(Metrics.changeAuthScreenButtonBottomInset)
        }
    }
    
    func configureAction() {
        authButton.addTarget(self, action: #selector(signUp), for: .touchDown)
        firstNameInputField.addTarget(self, action: #selector(editedTextField), for: .editingChanged)
        lastNameInputField.addTarget(self, action: #selector(editedTextField), for: .editingChanged)
        birthdateInputField.addTarget(self, action: #selector(editedTextField), for: .editingChanged)
        passwordInputField.addTarget(self, action: #selector(editedTextField), for: .editingChanged)
        confirmPasswordInputField.addTarget(self, action: #selector(editedTextField), for: .editingChanged)
    }
    
    
    //- MARK: Actions

    @objc
    func signUp() {
        let user = UserRegisterModel(firstName: firstNameInputField.text ?? String(),
                                     lastName: lastNameInputField.text ?? String(),
                                     birthdate: birthdateInputField.text ?? String(),
                                     password: passwordInputField.text ?? String(),
                                     confirmPassword: confirmPasswordInputField.text ?? String())
        
        authButtonPressed?(user)
    }
    
    @objc
    func editedTextField() {
        let user = UserRegisterModel(firstName: firstNameInputField.text ?? String(),
                                     lastName: lastNameInputField.text ?? String(),
                                     birthdate: birthdateInputField.text ?? String(),
                                     password: passwordInputField.text ?? String(),
                                     confirmPassword: confirmPasswordInputField.text ?? String())
        
        editedTextFieldHandler?(user)
    }
}
