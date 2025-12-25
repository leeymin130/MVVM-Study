//
//  CoinImageService.swift
//  SwiftfulCrypto
//
//  Created by yoomin on 12/24/25.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    
    @Published var image: UIImage? = nil
    
    var imageSubscriptions: AnyCancellable?
    
    init(urlString: String) {
        getCoinImage(urlString: urlString)
    }
    
    func getCoinImage(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        imageSubscriptions = NetworkingManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedImage) in
                self?.image = returnedImage
                self?.imageSubscriptions?.cancel()
            })

    }
}
