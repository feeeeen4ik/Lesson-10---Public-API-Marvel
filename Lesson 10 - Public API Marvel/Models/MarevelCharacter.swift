//
//  MarevelCharacter.swift
//  Lesson 10 - Public API Marvel
//
//  Created by Феликс on 25.10.2025.
//

import Foundation

struct MarevelCharacter: Codable {
    let code: Int
    let status: String
    let copyright: String
    let atributionText: String
    let atributionsHTML: String
    let data: MarevelCharacterData
    let etag: String
}

struct MarevelCharacterData: Codable {
    let offset: Int
    let total: Int
    let limit: Int
    let count: Int
    let results: [MarevelCharacterResult]
}

struct MarevelCharacterResult: Codable {
    let id: Int
    let name: String
    let description: String
    let modified: Date
    let resourceURI: String
    let urls: [MarevelCharacterURL]
    let thumbnail: MarevelCharacterThumbnail
    let comics: MarevelCharacterComics
    let stories: MarevelCharacterStories
    let events: MarevelCharacterEvents
    let series: MarevelCharacterSeries
}

struct MarevelCharacterURL: Codable {
    let type: String
    let url: String
}

struct MarevelCharacterThumbnail: Codable {
    let path: String
    let `extension`: String
}

struct MarevelCharacterComics: Codable {
    let available: Int
    let returned: Int
    let collectionURI: String
    let items: [MarevelCharacterComicsItem]
}

struct MarevelCharacterComicsItem: Codable {
    let resourceURI: String
    let name: String
}

struct MarevelCharacterStories: Codable {
    let available: Int
    let returned: Int
    let collectionURI: String
    let items: [MarevelCharacterStoriesItem]
}

struct MarevelCharacterStoriesItem: Codable {
    let resourceURI: String
    let name: String
    let type: String
}

struct MarevelCharacterEvents: Codable {
    let available: Int
    let returned: Int
    let collectionURI: String
    let items: [MarevelCharacterEventsItem]
}

struct MarevelCharacterEventsItem: Codable {
    let resourceURI: String
    let name: String
}

struct MarevelCharacterSeries: Codable {
    let available: Int
    let returned: Int
    let collectionURI: String
    let items: [MarevelCharacterSeriesItem]
}

struct MarevelCharacterSeriesItem: Codable {
    let resourceURI: String
    let name: String
}
