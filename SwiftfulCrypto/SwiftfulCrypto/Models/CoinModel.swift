//
//  CoinModel.swift
//  SwiftfulCrypto
//
//  Created by yoomin on 11/11/25.
//

import Foundation

// CoinGecko API info
/*
 URL:
     https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&price_change_percentage=24h&per_page=250&order=market_cap_desc&page=1&sparkline=true
 
 JSON Response:
 {
 "id": "bitcoin",
 "symbol": "btc",
 "name": "Bitcoin",
 "image": "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
 "current_price": 106734,
 "market_cap": 2133892575580,
 "market_cap_rank": 1,
 "fully_diluted_valuation": 2133892575580,
 "total_volume": 67456267029,
 "high_24h": 107357,
 "low_24h": 104768,
 "price_change_24h": 1077.79,
 "price_change_percentage_24h": 1.02009,
 "market_cap_change_24h": 23266524904,
 "market_cap_change_percentage_24h": 1.10235,
 "circulating_supply": 19946887,
 "total_supply": 19946887,
 "max_supply": 21000000,
 "ath": 126080,
 "ath_change_percentage": -15.21414,
 "ath_date": "2025-10-06T18:57:42.558Z",
 "atl": 67.81,
 "atl_change_percentage": 157545.62564,
 "atl_date": "2013-07-06T00:00:00.000Z",
 "roi": null,
 "last_updated": "2025-11-11T02:44:52.117Z",
 "sparkline_in_7d": {
 "price": [
 106521.08673825761,
 106525.49363967453,
 ...
 ]
 },
 "price_change_percentage_24h_in_currency": 1.0200929679321127
 }
 
 */

struct CoinModel {
    let id, symbol, name: String?
    let image: String?
    let currentPrice, marketCap, marketCapRank, fullyDilutedValuation: Int?
    let totalVolume, high24H, low24H: Int?
    let priceChange24H, priceChangePercentage24H: Double?
    let marketCapChange24H: Int?
    let marketCapChangePercentage24H: Double?
    let circulatingSupply, totalSupply, maxSupply, ath: Int?
    let athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let roi: NSNull?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D?
    let priceChangePercentage24HInCurrency: Double?
}

struct SparklineIn7D: Codable {
    let price: [Double]?
}
