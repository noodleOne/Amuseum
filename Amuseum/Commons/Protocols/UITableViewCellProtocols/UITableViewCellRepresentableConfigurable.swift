//
//  UITableViewCellRepresentableConfigurable.swift
//  Amuseum
//
//  Created by Serj Agopian on 4/21/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import UIKit

protocol UITableViewCellRepresentableConfigurable {
    
    func configure(with representable: UITableViewCellRepresentable)
    
}

extension UITableViewCell: UITableViewCellRepresentableConfigurable {
    
    func configure(with representable: UITableViewCellRepresentable) {
        textLabel?.font = representable.font
        textLabel?.text = representable.title
        accessoryType = representable.accessoryType
        backgroundColor = representable.backgroundColor
    }
    
}

