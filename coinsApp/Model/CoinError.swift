//
//  CoinError.swift
//  coinsApp
//
//  Created by Ecc on 08.08.23.
//

import Foundation

enum CoinError: Error, LocalizedError {
    case invalidURL
    case serverError
    case invalidData
    case unkown(Error)
    
    var errorDescription: String? {
        switch self {
        case .serverError: return "There was an error with the server. Please try again later"
        case .invalidData: return "The coin data is invalid. Please try again later"
        case .unkown(let error): return error.localizedDescription
        case .invalidURL:
            return "The URL was invalid, please try again later"
        }
    }
    
}
