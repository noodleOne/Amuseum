//
//  MovieProtocol.swift
//  Amuseum
//
//  Created by Serj Agopian on 4/28/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import Foundation

struct Movie: Media {
    
    // MARK: - MediaProtocol Conformance Properties
    var name: String?
    var genre: MovieGenre?
    var creationDate: Date?
    var entertainmentType: EntertainmentType?
    
    // MARK: - Additional Properties
    var favoriteActor: String?
    
}

extension Movie {
    
    init(entertainmentType: EntertainmentType) {
        self.entertainmentType = entertainmentType
    }
    
}
