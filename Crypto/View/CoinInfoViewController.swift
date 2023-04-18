//
//  CoinInfoViewController.swift
//  Crypto
//
//  Created by Artem Alekseev on 04.03.2023.
//

import UIKit

class CoinInfoViewController: BaseInfoViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    var labelTextDict = [String: String]()
    
    override func makeImageAndText() {
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

    @objc override func backToList() {
        navigationController?.viewControllers.removeLast(1)
    }
}

