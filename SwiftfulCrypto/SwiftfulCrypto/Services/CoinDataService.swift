//
//  CoinDataService.swift
//  SwiftfulCrypto
//
//  Created by yoomin on 11/30/25.
//

import Foundation
import Combine

class CoinDataService {
    
    @Published var allCoins: [CoinModel] = []
    
    var coinSubscriptions: AnyCancellable?
    
    init() {
        getCoins()
    }
    
    private func getCoins() {
        
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&price_change_percentage=24h&per_page=250&order=market_cap_desc&page=1&sparkline=true") else { return }
        
        coinSubscriptions = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { (output) -> Data in
                
                guard let response = output.response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .receive(on: DispatchQueue.main)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink { (comletion) in
                switch comletion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                    
                }
            } receiveValue: { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
                self?.coinSubscriptions?.cancel()
            }
        
    }
}
