//
//  ViewModel.swift
//  Crypto
//
//  Created by Artem Alekseev on 21.03.2023.
//

import Foundation

protocol CoinListViewModelProtocol {
    var apiManager: APIService { get }
    var updateModel: ((Coin) -> ())? { get set }
    var coinsArray: [Coin] { get set }
    var updateController: () -> Void { get set }
    func getCoins()
}


final class CoinListViewModel: CoinListViewModelProtocol {
    
    
    var apiManager: APIService
    var coinsArray = [Coin]() {
        didSet {
            self.updateController()
        }
    }
    var updateController: () -> Void = {}
    
    init() {
        self.apiManager = APIService.shared
        getCoins()
    }
    
    func getCoins() {
        apiManager.getCoinsInfo { [weak self] coin in
            self?.coinsArray.append(coin)
        }
    }
    
    public var updateModel: ((Coin) -> ())?
    
}
