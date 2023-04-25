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
    
    private lazy var birthdate: UICustomTextField = {
        var view = UICustomTextField()
        view = view.getCustomTextField(placeholder: "Дата рождения", isSecured: false)
            
        return view
    }()
    
    private lazy var emailInputField: UICustomTextField = {
        var view = UICustomTextField()
        view = view.getCustomTextField(placeholder: "E-mail", isSecured: false)
            
        return view
    }()
        
    private lazy var passwordInputField: UICustomTextField = {
        var view = UICustomTextField()
        view = view.getCustomTextField(placeholder: "Пароль", isSecured: false)

        return view
    }()
    
    private lazy var confirmPasswordInputField: UICustomTextField = {
        var view = UICustomTextField()
        view = view.getCustomTextField(placeholder: "Повторите пароль", isSecured: false)

        return view
    }()
        
    private lazy var authButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .accentColorApplication
        view.layer.cornerRadius = Metrics.buttonCornerRadius
        view.layer.borderWidth = Metrics.buttonsBorderWidth
        view.setTitle("Зарегистрироваться", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.contentEdgeInsets = Metrics.authButtonEdgeInsets
            
        return view
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        
        indicator.color = .accentColorApplication
        indicator.hidesWhenStopped = true
        
        return indicator
    }()
    
    
    //- MARK: Public properties
    
    var changeScreenHandler: (() -> Void)?

    
    //- MARK: Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(imageLogo)
        self.addSubview(infoStack)
        self.addSubview(authButton)
        self.addSubview(activityIndicator)
        
        infoStack.addArrangedSubview(firstNameInputField)
        infoStack.addArrangedSubview(lastNameInputField)
        infoStack.addArrangedSubview(birthdate)
        infoStack.addArrangedSubview(emailInputField)
        infoStack.addArrangedSubview(passwordInputField)
        infoStack.addArrangedSubview(confirmPasswordInputField)
        
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //- MARK: Public methods
    
    func startAnumateIndicator() {
        activityIndicator.startAnimating()
        activityIndicator.alpha = 1
    }
    
    func stopAnimateIndicator() {
        activityIndicator.stopAnimating()
        activityIndicator.alpha = 0
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
        
        //authButton.addTarget(self, action: #selector(signUp(_:)), for: .touchDown)
    }
    
    
    //- MARK: Actions

}
