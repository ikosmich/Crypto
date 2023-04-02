//
//  LoginViewController.swift
//  Crypto
//
//  Created by Artem Alekseev on 04.03.2023.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    deinit {
        print("LOGIN CONTROLLER DIED")
    }
    private lazy var label: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "adventpro-regular", size: 70)
        lbl.text = "Crypto wallet"
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 0.5
        lbl.textAlignment = .center
        return lbl
    }()
    
    private lazy var usernameTextField: MyTextField = {
        let txtField = MyTextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.backgroundColor = .white
        txtField.placeholder = "Enter username"
        txtField.font = UIFont(name: "adventpro-regular", size: 20)
        txtField.textAlignment = .center
        txtField.layer.borderWidth = 1
        txtField.layer.shadowOpacity = 1
        txtField.layer.shadowRadius = 3
        txtField.layer.shadowOffset = CGSize.init(width: 0, height: 3)
        txtField.layer.shadowColor = UIColor.gray.cgColor
        txtField.returnKeyType = .next
        txtField.tag = 1
        txtField.autocorrectionType = .no
        txtField.autocapitalizationType = .none
        return txtField
    }()
    
    private lazy var passwordTextField: MyTextField = {
        let txtField = MyTextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.backgroundColor = .white
        txtField.placeholder = "Enter password"
        txtField.font = UIFont(name: "adventpro-regular", size: 20)
        txtField.textAlignment = .center
        txtField.layer.borderWidth = 1
        txtField.layer.shadowOpacity = 1
        txtField.layer.shadowRadius = 3
        txtField.layer.shadowOffset = CGSize.init(width: 0, height: 3)
        txtField.layer.shadowColor = UIColor.gray.cgColor
        txtField.returnKeyType = .done
        txtField.tag = 2
        txtField.autocorrectionType = .no
        txtField.autocapitalizationType = .none
        return txtField
    }()
    
    private lazy var loginButton: MyButton = {
        let btn = MyButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(red: 83/255, green: 109/255, blue: 244/255, alpha: 1)
        btn.setTitle("LOG IN", for: .normal)
        btn.titleLabel?.font = UIFont(name: "adventpro-regular", size: 20)
        btn.layer.shadowOpacity = 1
        btn.layer.shadowRadius = 3
        btn.layer.shadowOffset = CGSize.init(width: 0, height: 3)
        btn.layer.shadowColor = UIColor.systemGray.cgColor
        btn.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return btn
    }()
    
    @objc func buttonPressed() {
        let listVC = CoinsListViewController()
        // Fixed username/password
        switch (usernameTextField.text, passwordTextField.text) {
        case ("1234", "1234"):
            usernameTextField.text = ""
            passwordTextField.text = ""
            navigationController?.pushViewController(listVC, animated: true)
        default:
            let alert = UIAlertController(title: "Wrong username or password", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .destructive))
            self.present(alert, animated: true)
        }
        

    }
    
    private lazy var signUpButton: MyButton = {
        let btn = MyButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Sign up", for: .normal)
        btn.titleLabel?.font = UIFont(name: "adventpro-regular", size: 15)
        btn.backgroundColor = UIColor.clear
        btn.setTitleColor(.label, for: .normal)
        return btn
    }()
    
    private lazy var image: UIImageView = {
        let img = UIImageView(image: UIImage(named: "logo"))
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 203/255, green: 223/255, blue: 189/255, alpha: 1)
        setupUI()
        
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        makeCornerRadius()
    }
    
    // Keyboard dismiss by tapping outside textfield
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // Keyboard dismiss by tapping "done", next textfield by "next"
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        guard let nextTextField = textField.superview?.viewWithTag(nextTag) else {
            textField.resignFirstResponder()
            return false
        }
        nextTextField.becomeFirstResponder()
        return true
    }
    
    private func addSubViews() {
        view.addSubview(label)
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(image)
        view.addSubview(loginButton)
        view.addSubview(signUpButton)
    }
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                                     usernameTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 100),
                                     usernameTextField.centerXAnchor.constraint(equalTo: label.centerXAnchor),
                                     usernameTextField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 35),
                                     passwordTextField.widthAnchor.constraint(equalTo: usernameTextField.widthAnchor),
                                     passwordTextField.centerXAnchor.constraint(equalTo: usernameTextField.centerXAnchor),
                                     passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 35),
                                     image.centerXAnchor.constraint(equalTo: label.centerXAnchor),
                                     image.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
                                     image.heightAnchor.constraint(equalToConstant: view.frame.width - 100),
                                     image.widthAnchor.constraint(equalToConstant: view.frame.width - 100),
                                     loginButton.widthAnchor.constraint(equalToConstant: view.frame.width - 180),
                                     loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
                                     signUpButton.widthAnchor.constraint(equalToConstant: 50),
                                     signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     signUpButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
                                    ])
    }
    
    private func makeCornerRadius() {
        usernameTextField.layer.cornerRadius = usernameTextField.frame.height / 2
        passwordTextField.layer.cornerRadius = passwordTextField.frame.height / 2
        loginButton.layer.cornerRadius = loginButton.frame.height / 2
    }
    
    private func setupUI() {
        addSubViews()
        makeConstraints()
    }
}
