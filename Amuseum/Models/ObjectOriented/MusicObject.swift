//
//  Music.swift
//  Amuseum
//
//  Created by Serj Agopian on 4/24/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import Foundation

class MusicObject: MediaObject<MusicGenre> {
    
    let album: String
    let artist: String
    
    init(name: String, genre: MusicGenre, creationDate: Date, entertainmentType: EntertainmentType, album: String, artist: String) {
        self.album = album
        self.artist = artist
        super.init(name: name, genre: genre, entertainmentType: entertainmentType, creationDate: creationDate)
    }
    
    enum CodingKeys: String, CodingKey {
        case album
        case artist
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        album = try container.decode(String.self, forKey: .album)
        artist = try container.decode(String.self, forKey: .artist)
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(album, forKey: .album)
        try container.encode(artist, forKey: .artist)
        let superEncoder = container.superEncoder()
        try super.encode(to: superEncoder)
    }
    
}
