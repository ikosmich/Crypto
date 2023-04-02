//
//  CoinInfoViewController.swift
//  Crypto
//
//  Created by Artem Alekseev on 04.03.2023.
//

import UIKit

class CoinInfoViewController: UIViewController {
    
    deinit {
        print("INFO SCREEN DIED")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("info screen inited")
        view.backgroundColor = .systemBackground
        navigationItem.title = "Detailed info"
        // Do any additional setup after loading the view.
    }
}

extension CoinInfoViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var config = cell.defaultContentConfiguration()
        config.text = "test"
        cell.contentConfiguration = config
        return cell
    }
    
    
}
