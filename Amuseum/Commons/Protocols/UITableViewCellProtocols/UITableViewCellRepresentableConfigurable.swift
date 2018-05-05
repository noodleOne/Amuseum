//
//  UITableViewCellRepresentableConfigurable.swift
//  Amuseum
//
//  Created by Serj Agopian on 4/21/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import UIKit

protocol UITableViewCellRepresentableConfigurable {
    
    func configure(with defaultRepresentable: DefaultUITableViewCellRepresentable)
    
}

extension UITableViewCell: UITableViewCellRepresentableConfigurable {
    
    func configure(with defaultRepresentable: DefaultUITableViewCellRepresentable) {
        textLabel?.font = defaultRepresentable.font
        textLabel?.text = defaultRepresentable.title
        accessoryType = defaultRepresentable.accessoryType
        backgroundColor = defaultRepresentable.backgroundColor
        detailTextLabel?.text = defaultRepresentable.subtitle
        detailTextLabel?.textColor = defaultRepresentable.subtitleColor
    }
    
}

