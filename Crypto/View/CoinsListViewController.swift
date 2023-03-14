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
    

    @objc private func logOut() {
        
        navigationController?.popViewController(animated: true)
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
        navigationItem.title = "Coins"
        navigationItem.rightBarButtonItem = .init(title: nil, image: UIImage(systemName: "arrow.up.arrow.down"), target: nil, action: nil)
        navigationItem.leftBarButtonItem = .init(title: nil, image: .init(systemName: "arrowshape.backward.fill"), target: self, action: #selector(logOut))
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        navigationController?.navigationBar.prefersLargeTitles = false
        
        addSubViews()
        makeConstraints()
        view.backgroundColor = .systemBackground
        APIServise.shared.getCoinsInfo { [weak self] coin in
            self?.coinsArray.append(coin)
            DispatchQueue.main.async {
                
                self?.tableView.reloadData()
                
            }
        }
        
        
        
        
    }
    private func addSubViews() {
        view.addSubview(tableView)
    }
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                     tableView.widthAnchor.constraint(equalTo: view.widthAnchor),
                                     tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
                                    ])
    }
}

extension CoinsListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        coinsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var config = cell.defaultContentConfiguration()
        config.text = coinsArray[indexPath.row].data.name
        config.secondaryText = String(coinsArray[indexPath.row].data.marketData.priceUsd ?? 0 )
        cell.contentConfiguration = config
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let infoVC = CoinInfoViewController()
        navigationController?.pushViewController(infoVC, animated: true)
    }
    
}