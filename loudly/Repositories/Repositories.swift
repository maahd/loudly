//
//  Repositories.swift
//  loudly
//
//  Created by Maahd Shahzad on 10/24/20.
//  Copyright © 2020 Maahd Shahzad. All rights reserved.
//

import Foundation

// The Repositories struct is used to decode the JSON returned by the API call
// It conforms to the Codable protocol
struct Repositories: Codable {
    var items: [Item]
    
    enum CodingKeys: String, CodingKey {
        case items
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.items = try valueContainer.decode([Item].self, forKey: CodingKeys.items)
    }
}

// Repositories has an array of items
struct Item: Codable {
    var name: String
    var owner: Owner
    var size: Int
    var hasWiki: Bool
    
    enum CodingKeys: String, CodingKey {
        case name
        case owner
        case size
        case hasWiki = "has_wiki"
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try valueContainer.decode(String.self, forKey: CodingKeys.name)
        self.owner = try valueContainer.decode(Owner.self, forKey: CodingKeys.owner)
        self.size = try valueContainer.decode(Int.self, forKey: CodingKeys.size)
        self.hasWiki = try valueContainer.decode(Bool.self, forKey: CodingKeys.hasWiki)
    }
}

// Each item has one owner
struct Owner: Codable {
    var login: String
    
    enum CodingKeys: String, CodingKey {
        case login
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.login = try valueContainer.decode(String.self, forKey: CodingKeys.login)
    }
}


