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
    func isAreadyLogedIn() -> Bool
    func logIn(login: String, password: String) -> Bool
    func signUp(login: String, password: String)
    func logout()
}

class Users: UsersProtocol {
    static var shared = Users()
    private init() {}
    var userDefaults: UserDefaults = UserDefaults.standard
    func isAreadyLogedIn() -> Bool {
        userDefaults.bool(forKey: "isAreadyLogedIn")
    }
    var login: String?
    var password: String?
    func logIn(login: String, password: String) -> Bool {
        var isUser = false
        guard let storedPairs = userDefaults.array(forKey: "users") as? [[String]] else { return isUser }
        for namePasswordPair in storedPairs {
            if namePasswordPair == [login, password] {
                isUser = true
                userDefaults.set(true, forKey: "isAreadyLogedIn")
            }
        }
        return isUser
    }
    
    func logout() {
        userDefaults.set(false, forKey: "isAreadyLogedIn")
    }
    
    func signUp(login: String, password: String) {
        // New users add
    }
    
    
}
