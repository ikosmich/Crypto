//
//  BaseListViewController.swift
//  Crypto
//
//  Created by Artem Alekseev on 06.04.2023.
//

import UIKit

class BaseListViewController: UIViewController {
    
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.style = .large
        spinner.color = .systemGray
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    private func addSubViews() {
        view.addSubview(tableView)
        view.addSubview(spinner)
    }
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                     tableView.widthAnchor.constraint(equalTo: view.widthAnchor),
                                     tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                                     spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor)
                                    ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Coins"
        navigationItem.rightBarButtonItem = .init(title: nil, image: UIImage(systemName: "arrow.up.arrow.down"), target: self, action: #selector(sortList))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Log out", image: nil, target: self, action: #selector(logOut))
        tableView.register(CoinTableViewCell.self, forCellReuseIdentifier: CoinTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        view.backgroundColor = .systemBackground
        addSubViews()
        makeConstraints()
        spinner.startAnimating()
    }
    
    var listViewModel: CoinListViewModelProtocol
    
    init(listViewModel: CoinListViewModelProtocol) {
        self.listViewModel = listViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func sortList() {}
    @objc func logOut() {}
    
    
    
}

extension BaseListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewModel.coinsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CoinTableViewCell.identifier, for: indexPath) as? CoinTableViewCell else { return UITableViewCell() }
        cell.coinImageView.image = UIImage(named: listViewModel.coinsArray[indexPath.row].coinData.symbol)
        cell.coinNameLabel.text = listViewModel.coinsArray[indexPath.row].coinData.name
        if let coinCost = listViewModel.coinsArray[indexPath.row].coinData.marketData.priceUSD {
            cell.coinPriceUSDLabel.text = "$ price: \(coinCost.truncate(places: 3))"
        } else {
            cell.coinPriceUSDLabel.text = "$ --"
        }
        if let priceChange = listViewModel.coinsArray[indexPath.row].coinData.marketData.lastHourCostChangePercent {
            if priceChange > 0 {
                cell.priceChangePerHourLabel.text = "↑ \(priceChange.truncate(places: 2))%"
                cell.priceChangePerHourLabel.textColor = .systemGreen
            } else {
                cell.priceChangePerHourLabel.text = "↓ \(priceChange.truncate(places: 2))%"
                cell.priceChangePerHourLabel.textColor = .systemRed
            }
        } else {
            cell.priceChangePerHourLabel.text = "-- %"
            cell.priceChangePerHourLabel.textColor = .systemIndigo
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let infoVC = CoinInfoViewController()
        let coinFromRow = listViewModel.cellTapped(at: indexPath.row)
        infoVC.labelTextDict = coinFromRow
        navigationController?.viewControllers.append(infoVC)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
