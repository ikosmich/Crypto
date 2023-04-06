//
//  CoinsListViewController.swift
//  Crypto
//
//  Created by Artem Alekseev on 06.03.2023.
//

import UIKit

class CoinsListViewController: BaseListViewController {
    
    init() {
        super.init(listViewModel: CoinListViewModel())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listenViewModel()
    }
    
    private func listenViewModel() {
        listViewModel.updateView = { [weak self] coin in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.spinner.stopAnimating()
                self.tableView.reloadData()
            }
        }
    }
    
    @objc override func logOut() {
        listViewModel.logout()
        navigationController?.viewControllers[0] = LoginViewController()
    }
    
    @objc override func sortList() {
        listViewModel.sortButtonPressed()
    }
}


