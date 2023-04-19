//
//  CoinInfoViewController.swift
//  Crypto
//
//  Created by Artem Alekseev on 04.03.2023.
//

import UIKit

class CoinInfoViewController: UIViewController {
    
    init (_ coinData: [String:String]) {
        self.labelTextDict = coinData
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Detailed info"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.uturn.left"), style: .done, target: self, action: #selector(backToList))
        addSubviews()
        makeConstraints()
        makeImageAndText()
    }
    
    var labelTextDict: [String: String]
    
    func makeImageAndText() {
        let str = """
            \(labelTextDict["coinName"] ?? "")

            Cost USD: \(labelTextDict["coinCostUSD"] ?? "n/a")
            Last hour price change %: \(labelTextDict["coinLastHourCostPercent"] ?? "n/a")
            Last day price change %: \(labelTextDict["coinlastDayCostChangePercent"] ?? "n/a")
            Last day open price: \(labelTextDict["coinLastDayOpenPrice"] ?? "n/a")
            Last day lowest price: \(labelTextDict["coinLastDayLowPrice"] ?? "n/a")
            Last day high price: \(labelTextDict["coinLastDayHighPrice"] ?? "n/a")
            Last day close price: \(labelTextDict["coinLastDayClosePrice"] ?? "n/a")
            """
        infoLabel.text = str
        if let imageName = labelTextDict["coinSymbol"] {
            coinLogoView.image = UIImage(named: imageName)
        }
    }

    var coinLogoView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFill
        return imgView
    }()
    
    var infoLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.contentMode = .left
        lbl.numberOfLines = 0
        lbl.font = UIFont(name: "adventpro-regular", size: 22)
        return lbl
    }()
    
    func addSubviews() {
        view.addSubview(coinLogoView)
        view.addSubview(infoLabel)
    }
    
    func makeConstraints() {
        NSLayoutConstraint.activate([coinLogoView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -(view.frame.midY / 3)),
                                     coinLogoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     coinLogoView.widthAnchor.constraint(equalToConstant: view.frame.width / 2),
                                     coinLogoView.heightAnchor.constraint(equalTo: coinLogoView.widthAnchor),
                                     infoLabel.topAnchor.constraint(equalTo: coinLogoView.bottomAnchor, constant: 10),
                                     infoLabel.widthAnchor.constraint(equalTo: view.widthAnchor)])
    }
    
    @objc func backToList() {
        navigationController?.viewControllers.removeLast(1)
    }
}

