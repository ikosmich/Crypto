//
//  CoinsListViewController.swift
//  Crypto
//
//  Created by Artem Alekseev on 06.03.2023.
//

import UIKit

class CoinsListViewController: UIViewController {
    private let tableView = UITableView()
    private var coinsArray = [Coin]()
    
//DELETE OR EDIT TEST!!
    
    
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
        coinsArray.forEach { coin in
            print(coin.data.name)
        }
        
    }
// MARK: Show info vc func
    @objc private func info() {
        let infoViewController = CoinInfoViewController()
        infoViewController.modalPresentationStyle = .fullScreen
        infoViewController.modalTransitionStyle = .crossDissolve
        present(infoViewController, animated: true)
    }
    deinit {
        print("list controller died".uppercased())
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        addSubViews()
        //makeConstraints()
        
        //TEST DELETE OR EDIT
        view.backgroundColor = .green
        
        DispatchQueue.main .async {
            APIServise.shared.getCoinsInfo { [weak self] coin in
                self?.coinsArray.append(coin)
                
            }
            
        }
        
        
        
    }
    private func addSubViews() {
        view.addSubview(logOutButton)
        view.addSubview(tableView)
    }
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([logOutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     logOutButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                                     logOutButton.heightAnchor.constraint(equalToConstant: 40),
                                     tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                     tableView.widthAnchor.constraint(equalTo: view.widthAnchor),
                                     tableView.bottomAnchor.constraint(equalTo: logOutButton.topAnchor, constant: 10)
                                    ])
    }
}

extension CoinsListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        coinsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
        
        
        
    }
    
    
}
