//
//  FirebaseConstants.swift
//  Amuseum
//
//  Created by Serj Agopian on 4/27/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import Foundation

extension FirebaseManager {
    
    enum CollectionNames: String {
        case media
        
        var name: String {
            return self.rawValue.capitalizingFirstLetter()
        }
    }
    
    
}
