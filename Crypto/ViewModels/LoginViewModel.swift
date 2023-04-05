//
//  LoginViewModel.swift
//  Crypto
//
//  Created by Artem Alekseev on 04.04.2023.
//

import Foundation

protocol LoginViewModelProtocol {
    var login: String? { get set }
    var password: String? { get set }
    func logInButtonPressed()
    func signUpButtonPressed()
}

class LoginViewModel: LoginViewModelProtocol {
    var login: String?
    
    var password: String?
    
    func logInButtonPressed() {
        
    }
    
    func signUpButtonPressed() {
        
    }
    
    
}
