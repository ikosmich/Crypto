//
//  APIService.swift
//  Crypto
//
//  Created by Artem Alekseev on 04.03.2023.
//

import Foundation

fileprivate protocol APIServiceProtocol {
    var urlBase: String { get }
    var urlTail: String { get }
    func getCoinsInfo(_ completionHandler: @escaping ([Coin]?) -> Void)
}

fileprivate enum coinsTypes: String, CaseIterable {
    case btc, eth, tron, luna, polkadot, dogecoin, tether, stellar, cardano, xrp
}

//FIXME: апи на 1 запрос
final class APIService: APIServiceProtocol {
    static var shared = APIService()
    private init() {}
    
    var urlBase = "https://data.messari.io/api/v1/assets/"
    var urlTail = "/metrics"
    let dispachGroup = DispatchGroup()
    
    public func getCoinsInfo(_ completionHandler: @escaping ([Coin]?) -> Void) {
        var coinsArray = [Coin]()
        for index in coinsTypes.allCases {
            dispachGroup.enter()
            let url = urlBase + index.rawValue + urlTail
            guard let url = URL(string: url) else { return }
            let request = URLRequest(url: url)
            let urlTask = URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data, error == nil else {
                    print("Task error\n\(String(describing: error))\n")
                    completionHandler(nil)
                    self.dispachGroup.leave()
                    return
                }
                
                do {
                    let coin = try JSONDecoder().decode(Coin.self, from: data)
                    if coin.coinData != nil {
                        coinsArray.append(coin)
                    }
                    print(coin.coinData?.name ?? "no coin get")
                    self.dispachGroup.leave()
                } catch {
                    self.dispachGroup.leave()
                }
            }
            urlTask.resume()
        }
        dispachGroup.notify(queue: .main) {
            print("getCoinInfo tasks done, array count: \(coinsArray.count)")
            completionHandler(coinsArray)
        }
    }
}




