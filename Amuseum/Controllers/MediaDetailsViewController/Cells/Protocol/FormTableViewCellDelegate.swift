//
//  FormTableViewCellDelegate.swift
//  Amuseum
//
//  Created by Serj Agopian on 5/5/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import Foundation

protocol FormTableViewCellDelegate: class {
    func formValue(_ value: Any, forKey key: String)
}
