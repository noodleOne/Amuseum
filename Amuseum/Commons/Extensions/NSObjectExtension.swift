//
//  NSObjectExtension.swift
//  Spike
//
//  Created by Serj Agopian on 4/4/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import Foundation

extension NSObject {
    
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
    
}
