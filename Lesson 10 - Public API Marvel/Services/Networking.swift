//
//  Networking.swift
//  Lesson 10 - Public API Marvel
//
//  Created by Феликс on 25.10.2025.
//

import Foundation

enum links {
    case MarvelCharacters
    
    var baseUrl: URL? {
        switch self {
        case .MarvelCharacters:
            return URL(string: "https://gateway.marvel.com")
        }
    }
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    
}
