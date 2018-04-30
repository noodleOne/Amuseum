//
//  UITableViewCellRepresentable.swift
//  Amuseum
//
//  Created by Serj Agopian on 4/21/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import UIKit

protocol UITableViewCellRepresentable {
    
    var font: UIFont { get }
    var title: String { get }
    var subtitle: String? { get }
    var titleColor: UIColor { get }
    var subtitleColor: UIColor? { get }
    var reuseIdentifier: String { get }
    var backgroundColor: UIColor { get }
    var accessoryType: UITableViewCellAccessoryType { get }
    
}
