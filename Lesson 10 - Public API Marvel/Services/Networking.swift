//
//  Networking.swift
//  Lesson 10 - Public API Marvel
//
//  Created by Феликс on 26.10.2025.
//

import Foundation
import CryptoKit
import Alamofire

enum Links {
    case MarvelCharacters
    
    var baseUrl: URL {
        switch self {
        case .MarvelCharacters:
            return URL(string: "https://gateway.marvel.com:443/v1/public/characters")!
        }
    }
    
    var publicKey: String {
        "f00eca1af6935af62eb5a3cb64fcd95d"
    }
    
    var privateKey: String {
        "98f135c2af3398f4bba92dde1de50c0100319402"
    }
}

final class Networking {
    
    static let shared = Networking()
    
    private init() {}
    
    func fetchAllCharacters(
        nameStartsWith: String? = nil,
        characterID: Int? = nil,
        completion: @escaping (Result<[MarvelCharacter], Error>) -> Void
    ) {
        let ts = String(Date().timeIntervalSince1970)
        let toHash = ts + Links.MarvelCharacters.privateKey + Links.MarvelCharacters.publicKey
        let hash = Insecure.MD5.hash(data: toHash.data(using: .utf8)!)
                .map { String(format: "%02hhx", $0) }
                .joined()
        
        var parameters: [String: Any] = [
            "ts": ts,
            "apikey": Links.MarvelCharacters.publicKey,
            "hash": hash
        ]
        
        var baseURL = Links.MarvelCharacters.baseUrl
        if let nameStartsWith = nameStartsWith {
            parameters["nameStartsWith"] = nameStartsWith
        }
        
        if let characterID = characterID {
            baseURL = baseURL.appendingPathComponent("\(characterID)")
        }
        
        AF.request(baseURL, parameters: parameters)
            .validate()
            .responseDecodable(of: Marvel.self) { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data.data.results))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }

}
