//
//  Coin.swift
//  Crypto
//
//  Created by Artem Alekseev on 03.04.2023.
//

import Foundation

struct Coin: Decodable {
    let dataStatus: DataStatus
    let coinData: CoinData?
    enum CodingKeys: String, CodingKey {
        case dataStatus = "status"
        case coinData = "data"
    }
}

struct DataStatus: Decodable {
    let requestsLeft: UInt
    let dataRecieveDate: String
    let errorCode: UInt?
    let errorMessage: String?
    enum CodingKeys: String, CodingKey {
        case requestsLeft = "elapsed"
        case dataRecieveDate = "timestamp"
        case errorCode = "error_code"
        case errorMessage = "error_message"
    }
}

struct CoinData: Decodable {
    let symbol: String
    let name: String
    let marketData: MarketData
    enum CodingKeys: String, CodingKey {
        case symbol = "symbol"
        case name = "name"
        case marketData = "market_data"
    }
}

struct MarketData: Decodable {
    let priceUSD: Double?
    let lastHourCostChangePercent: Double?
    let lastDayCostChangePercent: Double?
    let openHighLowCloseVolumeLastHour: OpenHighLowCloseVolumeDataLastHourData?
    let openHighLowCloseVolumeLastDay: OpenHighLowCloseVolumeDataLastDayData?
    enum CodingKeys: String, CodingKey {
        case priceUSD = "price_usd"
        case lastHourCostChangePercent = "percent_change_usd_last_1_hour"
        case lastDayCostChangePercent = "percent_change_usd_last_24_hours"
        case openHighLowCloseVolumeLastHour = "ohlcv_last_1_hour"
        case openHighLowCloseVolumeLastDay = "ohlcv_last_24_hour"
    }
}

struct OpenHighLowCloseVolumeDataLastHourData: Decodable {
    let openPrice: Double
    let highPrice: Double
    let lowPrice: Double
    let closePrice: Double
    enum CodingKeys: String, CodingKey {
        case openPrice = "open"
        case highPrice = "high"
        case lowPrice = "low"
        case closePrice = "close"
    }
}

struct OpenHighLowCloseVolumeDataLastDayData: Decodable {
    let openPrice: Double
    let highPrice: Double
    let lowPrice: Double
    let closePrice: Double
    enum CodingKeys: String, CodingKey {
        case openPrice = "open"
        case highPrice = "high"
        case lowPrice = "low"
        case closePrice = "close"
    }
}
