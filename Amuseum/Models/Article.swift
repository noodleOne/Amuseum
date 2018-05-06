//
//  Article.swift
//  Amuseum
//
//  Created by Serj Agopian on 4/28/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import Foundation

struct Article: Media {
    
    // MARK: - MediaProtocol Conformance Properties
    var name: String?
    var genre: BookGenre?
    var creationDate: Date?
    var entertainmentType: EntertainmentType?
    
    // MARK: - Additional Properties
    var author: String?
    var source: String?
    var publishedDate: Date?
    
}

extension Article {
    
    init(entertainmentType: EntertainmentType) {
        self.entertainmentType = entertainmentType
    }
    
}
