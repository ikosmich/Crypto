//
//  TableViewCell.swift
//  Crypto
//
//  Created by Artem Alekseev on 04.03.2023.
//

import UIKit

protocol CoinTableViewCellProtocol {
    static var identifier: String { get }
    var coinImageView: UIImageView { get }
    var coinNameLabel: UILabel { get }
    var coinPriceUSDLabel: UILabel { get }
    var priceChangePerHourLabel: UILabel { get }
    func makeCellContent(image: String?, name: String?, price: Double?, priceChange: Double?)
    func makeCell()
}

class CoinTableViewCell: UITableViewCell, CoinTableViewCellProtocol {
    var coinImageView = UIImageView()
    var coinNameLabel = UILabel()
    var coinPriceUSDLabel = UILabel()
    var priceChangePerHourLabel = UILabel()
    static let identifier = "CoinCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        makeCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeCell () {
        coinNameLabel.font = UIFont(name: "adventpro-semibold", size: 27)
        coinPriceUSDLabel.font = UIFont(name: "adventpro-regular", size: 18)
        priceChangePerHourLabel.font = UIFont(name: "adventpro-regular", size: 18)
        coinImageView.translatesAutoresizingMaskIntoConstraints = false
        coinNameLabel.translatesAutoresizingMaskIntoConstraints = false
        coinPriceUSDLabel.translatesAutoresizingMaskIntoConstraints = false
        priceChangePerHourLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(coinImageView)
        contentView.addSubview(coinNameLabel)
        contentView.addSubview(coinPriceUSDLabel)
        contentView.addSubview(priceChangePerHourLabel)
        
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(greaterThanOrEqualTo: coinImageView.heightAnchor),
            coinImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            coinImageView.heightAnchor.constraint(equalToConstant: 75),
            coinImageView.widthAnchor.constraint(equalTo: coinImageView.heightAnchor),
            coinNameLabel.leadingAnchor.constraint(equalTo: coinImageView.trailingAnchor, constant: 20),
            coinNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            coinNameLabel.bottomAnchor.constraint(equalTo: coinPriceUSDLabel.topAnchor, constant: 10),
            coinPriceUSDLabel.leadingAnchor.constraint(equalTo: coinImageView.trailingAnchor, constant: 20),
            coinPriceUSDLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10),
            priceChangePerHourLabel.topAnchor.constraint(equalTo: coinNameLabel.bottomAnchor, constant: 10),
            priceChangePerHourLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5)
        ])
    }
    
    func makeCellContent(image: String?, name: String?, price: Double?, priceChange: Double?) {
        coinImageView.image = UIImage(named: image ?? "xmark")
        coinNameLabel.text = name
        if let price = price {
            coinPriceUSDLabel.text = "$ price: \(price.truncate(places: 3))"
        } else {
            coinPriceUSDLabel.text = "$ --"
        }
        if let priceChange = priceChange {
            if priceChange > 0 {
                priceChangePerHourLabel.text = "↑ \(priceChange.truncate(places: 2))%"
                priceChangePerHourLabel.textColor = .systemGreen
            } else {
                priceChangePerHourLabel.text = "↓ \(priceChange.truncate(places: 2))%"
                priceChangePerHourLabel.textColor = .systemRed
            }
        } else {
            priceChangePerHourLabel.text = "-- %"
            priceChangePerHourLabel.textColor = .systemIndigo
        }
    }
}


