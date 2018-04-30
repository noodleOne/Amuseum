//
//  Document.swift
//  Amuseum
//
//  Created by Serj Agopian on 4/29/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import Foundation

protocol Collection {
    var owningDocument: Document? { get set }
}

extension Collection {
    var name: String {
        return String(describing: type(of: self))
    }
}

protocol Document {
    var collection: Collection { get set }
}

extension Document {
    
    var path: String {
        var path: String = ""
        while var parentDocument = collection.owningDocument {
            path += "\(parentDocument.path)/\(String(describing: type(of: parentDocument)))/"
            guard let document = parentDocument.collection.owningDocument else { break }
            parentDocument = document
        }
        path += collection.name
        return path
    }
    
}
