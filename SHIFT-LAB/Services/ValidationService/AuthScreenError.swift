//
//  AuthScreenError.swift
//  SHIFT-LAB
//
//  Created by Елена on 26.04.2023.
//

enum AuthScreenError: String, Error {
    case emptyFieldFirstName = "Поле с именем обязательно для заполнения"
    case emptyFieldLastName = "Поле с фамилией обязательно для заполнения"
    case emptyFieldBirthdate = "Поле с датой рождения обязательно для заполнения"
    case emptyFieldPassword = "Поле с паролем обязательно для заполнения"
    case emptyFieldConfirmPassword = "Поле с повторением пароля обязательно для заполнения"
    
    case notValidExpressionLastName = "Фамилия должна содержать не менее 2 символов"
    case notValidPasswordCountSymbol = "Пароль должен содержать не менее 6 символов"
    case notValidPassword = "Пароль должен содержать цифры и буквы верхнего регистра"

    case isNotMatchPassword = "Пароли не совпадают"
}
