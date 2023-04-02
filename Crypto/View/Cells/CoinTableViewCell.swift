//
//  TableViewCell.swift
//  Crypto
//
//  Created by Artem Alekseev on 04.03.2023.
//

import UIKit

protocol CoinTableViewCellProtocol {
    var coinImage: UIImageView { get }
    var coinName: UILabel { get }
    var coinPriceUSD: UILabel { get }
}

class CoinTableViewCell: UITableViewCell, CoinTableViewCellProtocol {
    var coinImage = UIImageView()
    var coinName = UILabel()
    var coinPriceUSD = UILabel()
    static let identifier = "CoinCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        coinName.font = UIFont(name: "adventpro-semibold", size: 27)
        coinPriceUSD.font = UIFont(name: "adventpro-regular", size: 18)
        coinImage.translatesAutoresizingMaskIntoConstraints = false
        coinName.translatesAutoresizingMaskIntoConstraints = false
        coinPriceUSD.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(coinImage)
        contentView.addSubview(coinName)
        contentView.addSubview(coinPriceUSD)
        
        NSLayoutConstraint.activate([
            coinImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            coinImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            coinImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            coinImage.heightAnchor.constraint(equalToConstant: 75),
            coinImage.widthAnchor.constraint(equalToConstant: 75),
            coinName.leadingAnchor.constraint(equalTo: coinImage.trailingAnchor, constant: 20),
            coinName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            coinName.bottomAnchor.constraint(equalTo: coinPriceUSD.topAnchor, constant: 10),
            coinPriceUSD.leadingAnchor.constraint(equalTo: coinImage.trailingAnchor, constant: 20),
            coinPriceUSD.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10),
            coinPriceUSD.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


