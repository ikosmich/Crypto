//
//  BaseLoginViewController.swift
//  Crypto
//
//  Created by Artem Alekseev on 06.04.2023.
//

import UIKit

class BaseLoginViewController: UIViewController {
    
    lazy var label: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "adventpro-regular", size: 70)
        lbl.text = "Crypto wallet"
        lbl.textColor = .black
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 0.5
        lbl.textAlignment = .center
        return lbl
    }()
    
    lazy var usernameTextField: MyTextField = {
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
    
    lazy var passwordTextField: MyTextField = {
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
    
    lazy var loginButton: MyButton = {
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
    
    lazy var signUpButton: MyButton = {
        let btn = MyButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Sign up", for: .normal)
        btn.titleLabel?.font = UIFont(name: "adventpro-regular", size: 15)
        btn.backgroundColor = UIColor.clear
        btn.setTitleColor(.label, for: .normal)
        return btn
    }()
    
    lazy var image: UIImageView = {
        let img = UIImageView(image: UIImage(named: "logo"))
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 203/255, green: 223/255, blue: 189/255, alpha: 1)
        view.overrideUserInterfaceStyle = .light
        navigationController?.navigationBar.isHidden = true
        setupUI()
        // Для возможности убрать клавиатуру при тапе вне текстфилда и для переключения с 1 на 2 текстфилд кнопкой return
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        makeCornerRadius()
    }
    
    @objc func buttonPressed() {}
    
    func setupUI() {
        addSubViews()
        makeConstraints()
    }
    
    func addSubViews() {
        view.addSubview(label)
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(image)
        view.addSubview(loginButton)
        view.addSubview(signUpButton)
    }
    
    func makeConstraints() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
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
    
    func makeCornerRadius() {
        usernameTextField.layer.cornerRadius = usernameTextField.frame.height / 2
        passwordTextField.layer.cornerRadius = passwordTextField.frame.height / 2
        loginButton.layer.cornerRadius = loginButton.frame.height / 2
    }
    
}

extension BaseLoginViewController: UITextFieldDelegate {
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        guard let nextTextField = textField.superview?.viewWithTag(nextTag) else {
            textField.resignFirstResponder()
            return false
        }
        nextTextField.becomeFirstResponder()
        return true
    }
}
