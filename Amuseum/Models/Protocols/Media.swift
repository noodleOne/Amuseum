//
//  MediaProtocol.swift
//  Amuseum
//
//  Created by Serj Agopian on 4/28/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import Foundation
import SwiftKVC
import FirebaseFirestore
import CodableFirebase

extension Timestamp: TimestampType { }

protocol Media: Codable, Value {
    
    associatedtype Genre: (RawRepresentable)
    
    var name: String? { get set }
    var genre: Genre? { get set }
    var creationDate: Timestamp? { get set }
    var entertainmentType: EntertainmentType? { get set }
    
}
