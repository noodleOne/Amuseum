//
//  StringConstants.swift
//  Spike
//
//  Created by Serj Agopian on 4/6/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import Foundation

enum StringConstants: String {
    
    //MARK: - Alert Strings
    case okay = "ok"
    case cancel = "cancel"
    case delete = "delete"
    case error = "error"
    
    /// Localized String of the enum case
    var localized: String {
        switch self {
        default:
            return NSLocalizedString(self.rawValue, tableName: "Localizables", comment: "")
        }
        
    }
    
}
