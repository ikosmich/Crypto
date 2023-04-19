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

final class Users: UsersProtocol {
    static var shared = Users()
    private init() {}
    enum StorageKeys: String {
        case isAreadyLogedIn
        case users
    }
    var userDefaults: UserDefaults = UserDefaults.standard
    func isAreadyLogedIn() -> Bool {
        userDefaults.bool(forKey: StorageKeys.isAreadyLogedIn.rawValue)
    }
    var login: String?
    var password: String?
    func logIn(login: String, password: String) -> Bool {
        var isUser = false
        //Перебираем пары [Логин, Пароль] из UD для поиска совпадения с введенной парой. После найденного совпадения отмечаем в UD, что пользователь залогинился.
        
        guard let storedPairs = userDefaults.array(forKey: StorageKeys.users.rawValue) as? [[String]] else { return isUser }
        for namePasswordPair in storedPairs {
            if namePasswordPair == [login, password] {
                isUser = true
                userDefaults.set(isUser, forKey: StorageKeys.isAreadyLogedIn.rawValue)
            }
        }
        return isUser
    }
    
    func logout() {
        userDefaults.set(false, forKey: StorageKeys.isAreadyLogedIn.rawValue)
    }
    
    func signUp(login: String, password: String) {
        // New users add
    }
}
