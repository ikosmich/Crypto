//
//  CoinsListViewController.swift
//  Crypto
//
//  Created by Artem Alekseev on 06.03.2023.
//

import UIKit

class CoinsListViewController: UIViewController {
    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.style = .large
        spinner.color = .systemGray
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    private var listViewModel: CoinListViewModelProtocol?
    
    

    deinit {
        print("list controller died".uppercased())
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Coins"
        navigationItem.rightBarButtonItem = .init(title: nil, image: UIImage(systemName: "arrow.up.arrow.down"), target: self, action: #selector(sortList))
        navigationItem.leftBarButtonItem = .init(title: nil, image: .init(systemName: "arrowshape.backward.fill"), target: self, action: #selector(logOut))
        tableView.register(CoinTableViewCell.self, forCellReuseIdentifier: CoinTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        view.backgroundColor = .systemBackground
        listViewModel = CoinListViewModel()
        addSubViews()
        makeConstraints()
        spinner.startAnimating()
        listenViewModel()
    }
    
    func listenViewModel() {
        if var vm = listViewModel {
            vm.updateView = { [weak self] coin in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    self.spinner.stopAnimating()
                    self.tableView.reloadData()
                }
            }
        }
    }
    
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
    @objc private func logOut() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func sortList() {
        guard let vm = listViewModel else { return }
        vm.sortButtonPressed()
    }
}



extension CoinsListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let vm = listViewModel {
            return vm.coinsArray.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CoinTableViewCell.identifier, for: indexPath) as? CoinTableViewCell else { return UITableViewCell() }
        guard let vm = listViewModel else { return UITableViewCell() }
        cell.coinImageView.image = UIImage(named: vm.coinsArray[indexPath.row].coinData.symbol)
        cell.coinNameLabel.text = vm.coinsArray[indexPath.row].coinData.name
        if let coinCost = vm.coinsArray[indexPath.row].coinData.marketData.priceUSD {
            cell.coinPriceUSDLabel.text = "$ price: \(coinCost.truncate(places: 3))"
        } else {
            cell.coinPriceUSDLabel.text = "$ --"
        }
        if let priceChange = vm.coinsArray[indexPath.row].coinData.marketData.lastHourCostChangePercent {
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
        navigationController?.pushViewController(infoVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
