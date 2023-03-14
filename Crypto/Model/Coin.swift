// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let coin = try? JSONDecoder().decode(Coin.self, from: jsonData)

import Foundation

// MARK: - Coin
struct Coin: Codable {
    let data: Data
    let status: Status

    enum CodingKeys: String, CodingKey {
        case data = "data"
        case status = "status"
    }
}

// MARK: - Status
struct Status: Codable {
    let elapsed: Int
    let timestamp: String
    let errorMessage: String?

    enum CodingKeys: String, CodingKey {
        case elapsed = "elapsed"
        case timestamp = "timestamp"
        case errorMessage = "error_message"
    }
}

// MARK: - DataClass
struct Data: Codable {
    let id: String
    let serialID: Int
    let symbol: String
    let name: String
    let slug: String
    let internalTempAgoraID: String
    let marketData: MarketData
    let marketcap: Marketcap
    let supply: Supply
    let blockchainStats24_Hours: [String: Double?]
    let allTimeHigh: AllTimeHigh
    let cycleLow: CycleLow
    let roiData: [String: Double?]
    let riskMetrics: RiskMetrics
    let onChainData: [String: Double?]
    let exchangeFlows: [String: Double?]
    let supplyActivity: [String: Double?]
    let supplyDistribution: [String: Double?]

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case serialID = "serial_id"
        case symbol = "symbol"
        case name = "name"
        case slug = "slug"
        case internalTempAgoraID = "_internal_temp_agora_id"
        case marketData = "market_data"
        case marketcap = "marketcap"
        case supply = "supply"
        case blockchainStats24_Hours = "blockchain_stats_24_hours"
        case allTimeHigh = "all_time_high"
        case cycleLow = "cycle_low"
        case roiData = "roi_data"
        case riskMetrics = "risk_metrics"
        case onChainData = "on_chain_data"
        case exchangeFlows = "exchange_flows"
        case supplyActivity = "supply_activity"
        case supplyDistribution = "supply_distribution"
    }
}

// MARK: - AllTimeHigh
struct AllTimeHigh: Codable {
    let price: Double?
    let at: String?
    let daysSince: Int?
    let percentDown: Double?
    let breakevenMultiple: Double?

    enum CodingKeys: String, CodingKey {
        case price = "price"
        case at = "at"
        case daysSince = "days_since"
        case percentDown = "percent_down"
        case breakevenMultiple = "breakeven_multiple"
    }
}

// MARK: - CycleLow
struct CycleLow: Codable {
    let price: Double?
    let at: String?
    let percentUp: Double?
    let daysSince: Int?

    enum CodingKeys: String, CodingKey {
        case price = "price"
        case at = "at"
        case percentUp = "percent_up"
        case daysSince = "days_since"
    }
}

// MARK: - MarketData
struct MarketData: Codable {
    let priceUsd: Double?
    let priceBtc: Double?
    let priceEth: Double?
    let volumeLast24_Hours: Double?
    let realVolumeLast24_Hours: Double?
    let volumeLast24_HoursOverstatementMultiple: Double?
    let percentChangeUsdLast1_Hour: Double?
    let percentChangeBtcLast1_Hour: Double?
    let percentChangeEthLast1_Hour: Double?
    let percentChangeUsdLast24_Hours: Double?
    let percentChangeBtcLast24_Hours: Double?
    let percentChangeEthLast24_Hours: Double?
    let lastTradeAt: String?

    enum CodingKeys: String, CodingKey {
        case priceUsd = "price_usd"
        case priceBtc = "price_btc"
        case priceEth = "price_eth"
        case volumeLast24_Hours = "volume_last_24_hours"
        case realVolumeLast24_Hours = "real_volume_last_24_hours"
        case volumeLast24_HoursOverstatementMultiple = "volume_last_24_hours_overstatement_multiple"
        case percentChangeUsdLast1_Hour = "percent_change_usd_last_1_hour"
        case percentChangeBtcLast1_Hour = "percent_change_btc_last_1_hour"
        case percentChangeEthLast1_Hour = "percent_change_eth_last_1_hour"
        case percentChangeUsdLast24_Hours = "percent_change_usd_last_24_hours"
        case percentChangeBtcLast24_Hours = "percent_change_btc_last_24_hours"
        case percentChangeEthLast24_Hours = "percent_change_eth_last_24_hours"
        case lastTradeAt = "last_trade_at"
    }
}

// MARK: - Marketcap
struct Marketcap: Codable {
    let rank: Int?
    let marketcapDominancePercent: Double?
    let currentMarketcapUsd: Double?
    let y2050_MarketcapUsd: Double?
    let yPlus10MarketcapUsd: Double?
    let liquidMarketcapUsd: Double?
    let volumeTurnoverLast24_HoursPercent: Double?
    let realizedMarketcapUsd: Double?
    let outstandingMarketcapUsd: Double?

    enum CodingKeys: String, CodingKey {
        case rank = "rank"
        case marketcapDominancePercent = "marketcap_dominance_percent"
        case currentMarketcapUsd = "current_marketcap_usd"
        case y2050_MarketcapUsd = "y_2050_marketcap_usd"
        case yPlus10MarketcapUsd = "y_plus10_marketcap_usd"
        case liquidMarketcapUsd = "liquid_marketcap_usd"
        case volumeTurnoverLast24_HoursPercent = "volume_turnover_last_24_hours_percent"
        case realizedMarketcapUsd = "realized_marketcap_usd"
        case outstandingMarketcapUsd = "outstanding_marketcap_usd"
    }
}

// MARK: - RiskMetrics
struct RiskMetrics: Codable {
    let sharpeRatios: SharpeRatios
    let volatilityStats: VolatilityStats

    enum CodingKeys: String, CodingKey {
        case sharpeRatios = "sharpe_ratios"
        case volatilityStats = "volatility_stats"
    }
}

// MARK: - SharpeRatios
struct SharpeRatios: Codable {
    let last30_Days: Double?
    let last90_Days: Double?
    let last1_Year: Double?
    let last3_Years: Double?

    enum CodingKeys: String, CodingKey {
        case last30_Days = "last_30_days"
        case last90_Days = "last_90_days"
        case last1_Year = "last_1_year"
        case last3_Years = "last_3_years"
    }
}

// MARK: - VolatilityStats
struct VolatilityStats: Codable {
    let volatilityLast30_Days: Double?
    let volatilityLast90_Days: Double?
    let volatilityLast1_Year: Double?
    let volatilityLast3_Years: Double?

    enum CodingKeys: String, CodingKey {
        case volatilityLast30_Days = "volatility_last_30_days"
        case volatilityLast90_Days = "volatility_last_90_days"
        case volatilityLast1_Year = "volatility_last_1_year"
        case volatilityLast3_Years = "volatility_last_3_years"
    }
}

// MARK: - Supply
struct Supply: Codable {
    let y2050: Double?
    let yPlus10: Double?
    let liquid: Double?
    let circulating: Double?
    let y2050_IssuedPercent: Double?
    let annualInflationPercent: Double?
    let stockToFlow: Double?
    let yPlus10IssuedPercent: Double?
    let supplyRevived90D: Double?

    enum CodingKeys: String, CodingKey {
        case y2050 = "y_2050"
        case yPlus10 = "y_plus10"
        case liquid = "liquid"
        case circulating = "circulating"
        case y2050_IssuedPercent = "y_2050_issued_percent"
        case annualInflationPercent = "annual_inflation_percent"
        case stockToFlow = "stock_to_flow"
        case yPlus10IssuedPercent = "y_plus10_issued_percent"
        case supplyRevived90D = "supply_revived_90d"
    }
}



