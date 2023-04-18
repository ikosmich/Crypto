//
//  LoginViewController.swift
//  Crypto
//
//  Created by Artem Alekseev on 04.03.2023.
//

import UIKit

class LoginViewController: BaseLoginViewController {
    
    var loginViewModel: LoginViewModelProtocol
    
    init() {
        self.loginViewModel = LoginViewModel()
        super.init(nibName: nil, bundle: nil)
//MARK: Hardcode default test user
        UserDefaults.standard.set([["1234", "1234"]], forKey: "users")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func listenViewModel() {
        loginViewModel.updateView = { [weak self] in
            guard let _ = self else { return }
        }
    }
    
    @objc override func buttonPressed() {
        switch loginViewModel.logInButtonPressed(with: usernameTextField.text ?? "", password: passwordTextField.text ?? "") {
        case false:
            let alert = UIAlertController(title: "Wrong username or password", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .destructive))
            self.present(alert, animated: true)
            usernameTextField.text = nil
            passwordTextField.text = nil
        case true:
            let listVC = CoinsListViewController()
            navigationController?.viewControllers[0] = listVC
        }
    }
}
