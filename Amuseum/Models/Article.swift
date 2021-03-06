//
//  Article.swift
//  Amuseum
//
//  Created by Serj Agopian on 4/28/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import Foundation
import FirebaseFirestore

struct Article: Media {
    
    // MARK: - MediaProtocol Conformance Properties
    var name: String?
    var genre: BookGenre?
    var creationDate: Timestamp?
    var entertainmentType: EntertainmentType?
    
    // MARK: - Additional Properties
    var author: String?
    var source: String?
    var publishedDate: Timestamp?
    
}

extension Article {
    
    init(entertainmentType: EntertainmentType) {
        self.entertainmentType = entertainmentType
    }
    
}
