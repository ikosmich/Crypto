//
//  APIService.swift
//  Crypto
//
//  Created by Artem Alekseev on 04.03.2023.
//

import Foundation

final class APIServise {
    static let shared = APIServise()
    private init() {}
    
    private let coinsTypes = ["btc", "eth", "tron", "luna", "polkadot", "dogecoin", "tether", "stellar", "cardano", "xrp"]
    
    let dispachGroup = DispatchGroup()
    
    public func getCoinsInfo(_ completionHandler: @escaping (Coin) -> Void) {
        for index in 0..<coinsTypes.count {
            dispachGroup.enter()
            let url = "https://data.messari.io/api/v1/assets/\(coinsTypes[index])/metrics"
            guard let url = URL(string: url) else { return }
            let request = URLRequest(url: url)
            let urlTask = URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data else { return }
                guard error == nil else {
                    print("Task error\n\(String(describing: error))\n")
                    return
                }
                do {
                    let coins = try JSONDecoder().decode(Coin.self, from: data)
                    
                    completionHandler(coins)
                } catch {
                    print("DECODING ERROR: \(error)")
                }
            }
            urlTask.resume()
            dispachGroup.leave()
        }
        dispachGroup.notify(queue: .main) {
            print("Group notify")
        }
      
    }
}




