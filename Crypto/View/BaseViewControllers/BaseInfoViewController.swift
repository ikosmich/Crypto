//
//  BaseInfoViewController.swift
//  Crypto
//
//  Created by Artem Alekseev on 06.04.2023.
//

import UIKit

class BaseInfoViewController: UIViewController {
    
    var coinLogoView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFill
        return imgView
    }()
    
    var infoLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.contentMode = .left
        lbl.numberOfLines = 0
        lbl.font = UIFont(name: "adventpro-regular", size: 22)
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Detailed info"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.uturn.left"), style: .done, target: self, action: #selector(backToList))
        addSubviews()
        makeConstraints()
        makeImageAndText()
    }
    
    @objc func backToList() {}
    func makeImageAndText() {}
    
    func addSubviews() {
        view.addSubview(coinLogoView)
        view.addSubview(infoLabel)
    }
    
    func makeConstraints() {
        NSLayoutConstraint.activate([coinLogoView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -(view.frame.midY / 3)),
                                     coinLogoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     coinLogoView.widthAnchor.constraint(equalToConstant: view.frame.width / 2),
                                     coinLogoView.heightAnchor.constraint(equalTo: coinLogoView.widthAnchor),
                                     infoLabel.topAnchor.constraint(equalTo: coinLogoView.bottomAnchor, constant: 10),
                                     infoLabel.widthAnchor.constraint(equalTo: view.widthAnchor)])
    }
    
}
