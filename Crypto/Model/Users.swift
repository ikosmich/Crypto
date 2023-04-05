//
//  Users.swift
//  Crypto
//
//  Created by Artem Alekseev on 04.04.2023.
//

import Foundation

protocol UsersProtocol {
    var userDefaults: UserDefaults { get }
    var login: String? { get }
    var password: String? { get }
    func logIn(login: String, password: String) -> Bool
    func signUp(login: String, password: String)
}

class Users: UsersProtocol {
    static var shared = Users()
    private init() {}
    var userDefaults: UserDefaults = UserDefaults.standard
    var login: String?
    var password: String?
    func logIn(login: String, password: String) -> Bool {
        var isUser = false
        guard let storedTuple = userDefaults.object(forKey: "users") as? (String, String) else { return isUser }
        if storedTuple == (login, password) {
            isUser = true
        }
        return isUser
    }
    
    func signUp(login: String, password: String) {
        
    }
    
    
}
