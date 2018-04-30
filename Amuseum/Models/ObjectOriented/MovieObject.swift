//
//  Movie.swift
//  Amuseum
//
//  Created by Serj Agopian on 4/24/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import Foundation

class MovieObject: MediaObject<MovieGenre> {
    
    let favoriteActors: String
    
    init(name: String, genre: MovieGenre, favoriteActors: String, creationDate: Date = Date()) {
        self.favoriteActors = favoriteActors
        super.init(name: name, genre: genre, entertainmentType: .movie, creationDate: creationDate)
    }
    
    enum CodingKeys: String, CodingKey {
        case favoriteActors
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        favoriteActors = try container.decode(String.self, forKey: .favoriteActors)
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(favoriteActors, forKey: .favoriteActors)
        let superEncoder = container.superEncoder()
        try super.encode(to: superEncoder)
    }
    
}
