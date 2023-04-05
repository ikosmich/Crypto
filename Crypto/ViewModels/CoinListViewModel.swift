//
//  ViewModel.swift
//  Crypto
//
//  Created by Artem Alekseev on 21.03.2023.
//

import Foundation

protocol CoinListViewModelProtocol {
    var apiManager: APIService { get }
    var coinsArray: [Coin] { get set }
    var updateView: ([Coin]) -> Void { get set }
    func getCoins()
    func sortButtonPressed()
}

final class CoinListViewModel: CoinListViewModelProtocol {
    var apiManager = APIService.shared
    var coinsArray = [Coin]() {
        willSet {
            self.updateView(newValue)
        }
    }
    public var updateView: (([Coin]) -> ()) = {_ in }
    
    func getCoins() {
        apiManager.getCoinsInfo { [weak self] coin in
            self?.coinsArray.append(coin)
        }
    }
    
    private var sortedAscending = true
    
    func sortButtonPressed() {
        if sortedAscending {
            coinsArray.sort { first, second in
                let firstPriceChange = first.coinData.marketData.lastHourCostChangePercent ?? 0
                let secondPriceChange = second.coinData.marketData.lastHourCostChangePercent ?? 0
                sortedAscending = false
                return firstPriceChange < secondPriceChange
            }
        } else {
            coinsArray.sort { first, second in
                let firstPriceChange = first.coinData.marketData.lastHourCostChangePercent ?? 0
                let secondPriceChange = second.coinData.marketData.lastHourCostChangePercent ?? 0
                sortedAscending = true
                return firstPriceChange > secondPriceChange
            }
        }
    }
       
    
    init() {
        self.getCoins()
    }
}
