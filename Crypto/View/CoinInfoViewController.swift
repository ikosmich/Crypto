//
//  CoinInfoViewController.swift
//  Crypto
//
//  Created by Artem Alekseev on 04.03.2023.
//

import UIKit

class CoinInfoViewController: UIViewController {
    private lazy var coinLogoView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.image = UIImage(named: "BTC")
        imgView.contentMode = .scaleAspectFill
        return imgView
    }()
    
    private lazy var infoLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.contentMode = .left
        lbl.numberOfLines = 0
        lbl.font = UIFont(name: "adventpro-regular", size: 18)
        lbl.text = "hefbveufhbvuefhbv\nhbvuhefbvurv\nijfviefhvbeifvn\njviejdvbeifvj \njinviefbvien\njfnviebfvib"
        return lbl
    }()
    
    
    deinit {
        print("INFO SCREEN DIED")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("info screen inited")
        view.backgroundColor = .systemBackground
        navigationItem.title = "Detailed info"
        addSubviews()
        makeConstraints()
        // Do any additional setup after loading the view.
    }
    
    private func addSubviews() {
        view.addSubview(coinLogoView)
        view.addSubview(infoLabel)
    }
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([coinLogoView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -(view.frame.midY / 3)),
                                     coinLogoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     coinLogoView.widthAnchor.constraint(equalToConstant: view.frame.width / 2),
                                     coinLogoView.heightAnchor.constraint(equalTo: coinLogoView.widthAnchor),
                                     infoLabel.topAnchor.constraint(equalTo: coinLogoView.bottomAnchor, constant: 10),
//                                     infoLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                                     infoLabel.widthAnchor.constraint(equalTo: view.widthAnchor)])
    }
    
}

