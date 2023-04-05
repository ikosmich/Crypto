//
//  LoginViewModel.swift
//  Crypto
//
//  Created by Artem Alekseev on 04.04.2023.
//

import Foundation

protocol LoginViewModelProtocol {
    var updateView: () -> Void { get set }
    var login: String? { get set }
    var password: String? { get set }
    var usersData: UsersProtocol { get set }
    func logInButtonPressed(with login: String, password: String) -> Bool
    func signUpButtonPressed()
}

final class LoginViewModel: LoginViewModelProtocol {
    var updateView: () -> Void = {}
    var login: String?
    var password: String?
    var usersData: UsersProtocol = Users.shared
    func logInButtonPressed(with login: String, password: String) -> Bool {
        usersData.logIn(login: login, password: password)
    }
    
    func signUpButtonPressed() {
        // New users add
    }
    
    
}
