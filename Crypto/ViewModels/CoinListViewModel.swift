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
    func cellTapped(at index: Int) -> [String: String]
    func logout()
}

final class CoinListViewModel: CoinListViewModelProtocol {
    private var usersData: UsersProtocol = Users.shared
    var apiManager = APIService.shared
    var coinsArray = [Coin]() {
        willSet {
            self.updateView(newValue)
        }
    }
    var updateView: (([Coin]) -> ()) = {_ in }
    
    func getCoins() {
        apiManager.getCoinsInfo { [weak self] coin in
            self?.coinsArray = coin ?? []
        }
    }
    
    private var sortedAscending = true
    func sortButtonPressed() {
        if sortedAscending {
            coinsArray.sort { first, second in
                let firstPriceChange = first.coinData?.marketData.lastHourCostChangePercent ?? 0
                let secondPriceChange = second.coinData?.marketData.lastHourCostChangePercent ?? 0
                sortedAscending = false
                return firstPriceChange < secondPriceChange
            }
        } else {
            coinsArray.sort { first, second in
                let firstPriceChange = first.coinData?.marketData.lastHourCostChangePercent ?? 0
                let secondPriceChange = second.coinData?.marketData.lastHourCostChangePercent ?? 0
                sortedAscending = true
                return firstPriceChange > secondPriceChange
            }
        }
    }
    
    //FIXME: переписать
    
    func cellTapped(at index: Int) -> [String: String] {
        guard let coinFromRow = coinsArray[index].coinData else {
            return [:]
        }
        return ["coinName": coinFromRow.name,
                "coinCostUSD": "\(coinFromRow.marketData.priceUSD?.truncate(places: 3) ?? 0)",
                "coinSymbol": coinFromRow.symbol,
                "coinLastHourCostPercent": "\(coinFromRow.marketData.lastHourCostChangePercent?.truncate(places: 3) ?? 0)",
                "coinlastDayCostChangePercent": "\(coinFromRow.marketData.lastDayCostChangePercent?.truncate(places: 3) ?? 0)",
                "coinLastDayOpenPrice": "\(coinFromRow.marketData.openHighLowCloseVolumeLastDay?.openPrice.truncate(places: 3) ?? 0)",
                "coinLastDayLowPrice": "\(coinFromRow.marketData.openHighLowCloseVolumeLastDay?.lowPrice.truncate(places: 3) ?? 0)",
                "coinLastDayHighPrice": "\(coinFromRow.marketData.openHighLowCloseVolumeLastDay?.highPrice.truncate(places: 3) ?? 0)",
                "coinLastDayClosePrice": "\(coinFromRow.marketData.openHighLowCloseVolumeLastDay?.closePrice.truncate(places: 3) ?? 0)"
                ]
    }
    
    func logout() {
        usersData.logout()
    }
    
    init() {
        self.getCoins()
    }
}
