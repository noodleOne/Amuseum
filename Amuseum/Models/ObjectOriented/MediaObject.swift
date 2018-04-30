//
//  Media.swift
//  Amuseum
//
//  Created by Serj Agopian on 4/24/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import Foundation

class MediaObject<Genre: Codable & RawRepresentable>: Codable {
    
    let name: String
    let genre: Genre
    let creationDate: Date
    let entertainmentType: EntertainmentType
    
    init(name: String, genre: Genre, entertainmentType: EntertainmentType, creationDate: Date = Date()) {
        self.name = name
        self.genre = genre
        self.creationDate = creationDate
        self.entertainmentType = entertainmentType
    }
    
    enum SuperCodingKeys: String, CodingKey {
        case name
        case genre
        case creationDate
        case entertainmentType
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: SuperCodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        genre = try container.decode(Genre.self, forKey: .genre)
        creationDate = try container.decode(Date.self, forKey: .creationDate)
        entertainmentType = try container.decode(EntertainmentType.self, forKey: .entertainmentType)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: SuperCodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(genre, forKey: .genre)
        try container.encode(creationDate, forKey: .creationDate)
        try container.encode(entertainmentType, forKey: .entertainmentType)
    }
    
}
