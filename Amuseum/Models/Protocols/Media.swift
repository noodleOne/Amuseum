//
//  MediaProtocol.swift
//  Amuseum
//
//  Created by Serj Agopian on 4/28/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import Foundation

protocol Media: Codable {
    
    associatedtype Genre: (RawRepresentable & Codable)
    
    var name: String { get set }
    var genre: Genre { get set }
    var creationDate: Date { get set }
    var entertainmentType: EntertainmentType { get set }
    
}
