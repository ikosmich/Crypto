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
        navigationController?.pushViewController(infoViewController, animated: true)
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
        tableView.register(CoinTableViewCell.self, forCellReuseIdentifier: CoinTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        navigationController?.navigationBar.prefersLargeTitles = true
        
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CoinTableViewCell.identifier, for: indexPath) as? CoinTableViewCell else { return UITableViewCell() }
        cell.coinImageView.image = UIImage(named: coinsArray[indexPath.row].coinData.symbol)
        cell.coinNameLabel.text = coinsArray[indexPath.row].coinData.name
        if let coinCost = coinsArray[indexPath.row].coinData.marketData.priceUSD {
            cell.coinPriceUSDLabel.text = "$ price: \(coinCost.truncate(places: 3))"
        } else {
            cell.coinPriceUSDLabel.text = "$ --"
        }
        if let priceChange = coinsArray[indexPath.row].coinData.marketData.lastHourCostChangePercent {
            if priceChange > 0 {
                cell.priceChangePerHourLabel.text = "↑ \(priceChange.truncate(places: 2))%"
                cell.priceChangePerHourLabel.textColor = .systemGreen
            } else {
                cell.priceChangePerHourLabel.text = "↓ \(priceChange.truncate(places: 2))%"
                cell.priceChangePerHourLabel.textColor = .systemRed
            }
        } else {
            cell.priceChangePerHourLabel.text = "-- %"
            cell.priceChangePerHourLabel.textColor = .black
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let infoVC = CoinInfoViewController()
        navigationController?.pushViewController(infoVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
