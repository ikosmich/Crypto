//
//  CoinsListViewController.swift
//  Crypto
//
//  Created by Artem Alekseev on 06.03.2023.
//

import UIKit

class CoinsListViewController: UIViewController {
    init() {
        self.listViewModel = CoinListViewModel()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Coins"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sort", style: .plain, target: self, action: #selector(sortList))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Log out", style: .plain, target: self, action: #selector(logOut))
        tableView.register(CoinTableViewCell.self, forCellReuseIdentifier: CoinTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        view.backgroundColor = .systemBackground
        addSubViews()
        makeConstraints()
        listenViewModel()
        spinner.startAnimating()
    }
    
    var listViewModel: CoinListViewModelProtocol
    
    private func listenViewModel() {
        listViewModel.updateView = { [weak self] coin in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.spinner.stopAnimating()
                self.tableView.reloadData()
            }
        }
    }
    
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
    
    @objc func logOut() {
        listViewModel.logout()
        navigationController?.viewControllers[0] = LoginViewController()
    }
    
    @objc func sortList() {
        listViewModel.sortButtonPressed()
    }
}

extension CoinsListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewModel.coinsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CoinTableViewCell.identifier, for: indexPath) as? CoinTableViewCell,
              let coinFromArray = listViewModel.coinsArray[indexPath.row].coinData else {
            return UITableViewCell()
        }
        cell.makeCellContent(image: coinFromArray.symbol,
                             name: coinFromArray.name,
                             price: coinFromArray.marketData.priceUSD,
                             priceChange: coinFromArray.marketData.lastHourCostChangePercent)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let infoVC = CoinInfoViewController(listViewModel.cellTapped(at: indexPath.row))
        navigationController?.viewControllers.append(infoVC)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
