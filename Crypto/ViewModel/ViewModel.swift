//
//  ViewModel.swift
//  Crypto
//
//  Created by Artem Alekseev on 21.03.2023.
//

import Foundation

protocol ViewModelProtocol {
    var updateModel: ((Coin) -> ())? { get set }
}


final class ViewModel: ViewModelProtocol {
    public var updateModel: ((Coin) -> ())?
    init() {
        
    }
    
}
