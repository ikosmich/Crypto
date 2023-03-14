//
//  TableViewCell.swift
//  Crypto
//
//  Created by Artem Alekseev on 04.03.2023.
//

import UIKit

class CoinTableViewCell: UITableViewCell {
    let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = ""
        return lbl
    }()
    

}

struct CellViewModel {
    let coinName: String
    let coinCost: String
    let coinPriceChangePerHour: String
}
