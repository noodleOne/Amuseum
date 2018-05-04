//
//  FormTableViewCellConfigurable.swift
//  Amuseum
//
//  Created by Serj Agopian on 5/4/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import Foundation

protocol FormTableViewCellConfigurable {
    
    /// Helper function to configure a view with the properties
    /// of the representable
    ///
    /// - Parameter representable: The Representable
    func configure(with representable: FormTableViewCellRepresentable)
    
}
