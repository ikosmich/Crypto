//
//  Double trimming.swift
//  Crypto
//
//  Created by Artem Alekseev on 21.03.2023.
//

import Foundation

extension Double {
    func truncate(places: Int) -> Double {
        return Double(floor(pow(10.0, Double(places)) * self)/pow(10.0, Double(places)))
    }
}
