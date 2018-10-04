//
//  SearchResource.swift
//  Celestial-MVVM-C
//
//  Created by VASS on 04/10/2018.
//  Copyright © 2018 VASS. All rights reserved.
//

import Foundation

struct SearchResource: Resourceable {
    let searchTerm: String

    typealias Resource = SearchResultResponse
    
    var url: URL {
        return URL(string: "https://images-api.nasa.gov/search?q=\(searchTerm)")!
    }
}

// MARK: DTOs

struct SearchResultResponse: Codable {
    let collection: SearchResultCollection
}

struct SearchResultCollection: Codable {
    let href: String
    let links: [NASALink]?
    let items: [SearchResultItem]?
}

struct NASALink: Codable {
    let prompt, rel: String?
    let href: String
}

struct SearchResultItem: Codable {
    let href: String
    let links: [NASALink]
    let data: [SearchItemInfo]
}

struct SearchItemInfo: Codable {
    let title, date_created: String
}
