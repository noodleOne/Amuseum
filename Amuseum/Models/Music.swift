//
//  Music.swift
//  Amuseum
//
//  Created by Serj Agopian on 4/28/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import Foundation
import FirebaseFirestore

struct Music: Media {
    
    // MARK: MediaProtocol Conformance Properties
    var name: String?
    var genre: MusicGenre?
    var creationDate: Timestamp?
    var entertainmentType: EntertainmentType?
    
    // MARK: - Additional Properties
    var album: String?
    var artist: String?
    
}

extension Music {
    
    init(entertainmentType: EntertainmentType) {
        self.entertainmentType = entertainmentType
    }
    
}
