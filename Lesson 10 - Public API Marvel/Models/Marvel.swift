//
//  MarevelCharacter.swift
//  Lesson 10 - Public API Marvel
//
//  Created by Феликс on 25.10.2025.
//

import Foundation

struct Marvel: Codable {
    let code: Int
    let status: String
    let copyright: String
    let atributionText: String
    let atributionsHTML: String
    let data: MarvelCharacterData
    let etag: String
    
//    init (MarevelCharacterDetails: [String: Any]) {
//        code = MarevelCharacterDetails["code"] as? Int ?? 0
//        status = MarevelCharacterDetails["status"] as? String ?? ""
//        copyright = MarevelCharacterDetails["copyright"] as? String ?? ""
//        atributionText = MarevelCharacterDetails["attributionText"] as? String ?? ""
//        atributionsHTML = MarevelCharacterDetails["attributionsHTML"] as? String ?? ""
//        
//        let dataDetails = MarevelCharacterDetails["data"] as? [String: Any] ?? [:]
//        data = MarevelCharacterData(MarevelCharacterData: dataDetails)
//        etag = MarevelCharacterDetails["etag"] as? String ?? ""
//        
//        
//    }
//    static func getHeroes(from value: Any) -> [Character] {
//        guard let charactersDetails = value as? [String: Any] else { return [] }
//        guard let results = charactersDetails["results"] as? [[String: Any]] else { return [] }
//        return results.map {Character(from: $0 as! Decoder)}
//        
//    }
}

struct MarvelCharacterData: Codable {
    let offset: Int
    let total: Int
    let limit: Int
    let count: Int
    let results: [Character]
    
//    init(MarevelCharacterData: [String: Any]) {
//        offset = MarevelCharacterData["offset"] as? Int ?? 0
//        total = MarevelCharacterData["total"] as? Int ?? 0
//        limit = MarevelCharacterData["limit"] as? Int ?? 0
//        count = MarevelCharacterData["count"] as? Int ?? 0
//        let resultsData = MarevelCharacterData["results"] as? [String: Any] ?? [:]
//        results = [Character.init(CharacterDetails: resultsData)]
//
//    }
}

struct Character: Codable {
    let id: Int
    let name: String
    let description: String
    let modified: Date
    let resourceURI: String
    let urls: [MarvelCharacterURL]
    let thumbnail: MarvelCharacterThumbnail
    let comics: MarvelCharacterComics
    let stories: MarvelCharacterStories
    let events: MarvelCharacterEvents
    let series: MarvelCharacterSeries
    
//    init(CharacterDetails: [String: Any]) {
//        id = CharacterDetails["id"] as? Int ?? 0
//        name = CharacterDetails["name"] as? String ?? ""
//        description = CharacterDetails["description"] as? String ?? ""
//        modified = CharacterDetails["modified"] as? Date ?? Date()
//        resourceURI = CharacterDetails["resourceURI"] as? String ?? ""
//        
//        let urlDetails = CharacterDetails["urls"] as? [String: String] ?? [:]
//        urls = [MarevelCharacterURL(MarevelCharacterURLDetails: urlDetails)]
//        
//        let thumbnailDetails = CharacterDetails["thumbnail"] as? [String: String] ?? [:]
//        thumbnail = MarevelCharacterThumbnail(MarevelCharacterThumbnailDetails: thumbnailDetails)
//        
//        let comicsDetails = CharacterDetails["comics"] as? [String: Any] ?? [:]
//        comics = MarevelCharacterComics(MarevelCharacterComicsDetails: comicsDetails)
//        
//        let storiesDetails = CharacterDetails["stories"] as? [String: Any] ?? [:]
//        stories = MarevelCharacterStories(MarevelCharacterStoriesDetails: storiesDetails)
//        
//        let eventsDetails = CharacterDetails["events"] as? [String: Any] ?? [:]
//        events = MarevelCharacterEvents(MarevelCharacterEventsDetails: eventsDetails)
//        
//        let seriesDetails = CharacterDetails["series"] as? [String: Any] ?? [:]
//        series = MarevelCharacterSeries(MarevelCharacterSeriesDetails: seriesDetails)
//    }
}

struct MarvelCharacterURL: Codable{
    let type, url: String
    
//    init(MarevelCharacterURLDetails: [String: String]) {
//        type = MarevelCharacterURLDetails["type"] ?? ""
//        url = MarevelCharacterURLDetails["url"] ?? ""
//    }
}

struct MarvelCharacterThumbnail: Codable {
    let path, `extension`: String
    
//    init(MarevelCharacterThumbnailDetails: [String: String]) {
//        path = MarevelCharacterThumbnailDetails["path"]  ?? ""
//        `extension` = MarevelCharacterThumbnailDetails["extension"] ?? ""
//    }
}

struct MarvelCharacterComics: Codable {
    let available, returned: Int
    let collectionURI: String
    let items: [MarvelCharacterComicsItem]
    
//    init(MarevelCharacterComicsDetails: [String: Any]) {
//        available = MarevelCharacterComicsDetails["available"] as? Int ?? 0
//        returned = MarevelCharacterComicsDetails["returned"] as? Int ?? 0
//        collectionURI = MarevelCharacterComicsDetails["collectionURI"] as? String ?? ""
//        let itemsDetails = MarevelCharacterComicsDetails["items"] as? [String: String] ?? [:]
//        items = [MarevelCharacterComicsItem.init(MarevelCharacterComicsItemDetails: itemsDetails)]
//    }
}

struct MarvelCharacterComicsItem: Codable {
    let resourceURI, name: String
    
//    init(MarevelCharacterComicsItemDetails: [String: String]) {
//        resourceURI = MarevelCharacterComicsItemDetails["resourceURI"] ?? ""
//        name = MarevelCharacterComicsItemDetails["name"] ?? ""
//    }
}

struct MarvelCharacterStories: Codable {
    let available, returned: Int
    let collectionURI: String
    let items: [MarvelCharacterStoriesItem]
    
//    init(MarevelCharacterStoriesDetails: [String: Any]) {
//        available = MarevelCharacterStoriesDetails["available"] as? Int ?? 0
//        returned = MarevelCharacterStoriesDetails["returned"] as? Int ?? 0
//        collectionURI = MarevelCharacterStoriesDetails["collectionURI"] as? String ?? ""
//        let itemsDetails = MarevelCharacterStoriesDetails["items"] as? [String: String] ?? [:]
//        items = [MarevelCharacterStoriesItem.init(MarevelCharacterStoriesItem: itemsDetails)]
//    }
}

struct MarvelCharacterStoriesItem: Codable {
    let resourceURI, type, name: String
    
//    init(MarevelCharacterStoriesItem: [String: String]) {
//        resourceURI = MarevelCharacterStoriesItem["resourceURI"] ?? ""
//        type = MarevelCharacterStoriesItem["type"] ?? ""
//        name = MarevelCharacterStoriesItem["name"] ?? ""
//    }
}

struct MarvelCharacterEvents: Codable {
    let available, returned: Int
    let collectionURI: String
    let items: [MarvelCharacterEventsItem]
    
//    init(MarevelCharacterEventsDetails: [String: Any]) {
//        available = MarevelCharacterEventsDetails["available"] as? Int ?? 0
//        returned = MarevelCharacterEventsDetails["returned"] as? Int ?? 0
//        collectionURI = MarevelCharacterEventsDetails["collectionURI"] as? String ?? ""
//        let itemsDetails = MarevelCharacterEventsDetails["items"] as? [String: String] ?? [:]
//        items = [MarevelCharacterEventsItem(MarevelCharacterEventsItemDetails: itemsDetails)]
//    }
}

struct MarvelCharacterEventsItem: Codable {
    let resourceURI, name: String
    
//    init(MarevelCharacterEventsItemDetails: [String: String]) {
//        resourceURI = MarevelCharacterEventsItemDetails["resourceURI"] ?? ""
//        name = MarevelCharacterEventsItemDetails["name"] ?? ""
//        
//    }
}

struct MarvelCharacterSeries: Codable {
    let available, returned: Int
    let collectionURI: String
    let items: [MarvelCharacterSeriesItem]
    
//    init(MarevelCharacterSeriesDetails: [String: Any]) {
//        available = MarevelCharacterSeriesDetails["available"] as? Int ?? 0
//        returned = MarevelCharacterSeriesDetails["returned"] as? Int ?? 0
//        collectionURI = MarevelCharacterSeriesDetails["collectionURI"] as? String ?? ""
//        let itemsDetails = MarevelCharacterSeriesDetails["items"] as? [String: String] ?? [:]
//        items = [MarevelCharacterSeriesItem(MarevelCharacterSeriesItemDetails: itemsDetails)]
//    }
}

struct MarvelCharacterSeriesItem: Codable {
    let resourceURI, name: String
    
//    init(MarevelCharacterSeriesItemDetails: [String: String]) {
//        resourceURI = MarevelCharacterSeriesItemDetails["resourceURI"] ?? ""
//        name = MarevelCharacterSeriesItemDetails["name"] ?? ""
//    }
}
