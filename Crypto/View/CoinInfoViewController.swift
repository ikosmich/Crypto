//
//  CoinInfoViewController.swift
//  Crypto
//
//  Created by Artem Alekseev on 04.03.2023.
//

import UIKit

class CoinInfoViewController: UIViewController {

    private lazy var logOutButton: MyButton = {
        let btn = MyButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(red: 83/255, green: 109/255, blue: 244/255, alpha: 1)
        btn.setTitle("LOG OUT", for: .normal)
        btn.titleLabel?.font = UIFont(name: "adventpro-regular", size: 20)
        btn.layer.shadowOpacity = 1
        btn.layer.shadowRadius = 3
        btn.layer.shadowOffset = CGSize.init(width: 0, height: 3)
        btn.layer.shadowColor = UIColor.systemGray.cgColor
        btn.addTarget(self, action: #selector(logOut), for: .touchUpInside)
        return btn
    }()
    // MARK:- TEST DELETE OR EDIT
    @objc private func logOut() {
        //let lgvc = LoginViewController()
//        present(lgvc, animated: true)
        dismiss(animated: true)
//        lgvc.modalPresentationStyle = .fullScreen
        //present(lgvc, animated: true)
//        show(lgvc, sender: UIButton.self)
    }
    
    //TEST DELETE OR EDIT
    deinit {
        print("INFO SCREEN DIED")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //TEST DELETE OR EDIT
        print("info screen inited")
        view.backgroundColor = .red
        view.addSubview(logOutButton)
        NSLayoutConstraint.activate([logOutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     logOutButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
        
        
        
        // Do any additional setup after loading the view.
    }
}
