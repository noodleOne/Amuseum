//
//  FormTableViewCellConfigurable.swift
//  Amuseum
//
//  Created by Serj Agopian on 5/4/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import Foundation

protocol FormTableViewCellConfigurable {
    
    var key: String { get set }
    var delegate: FormTableViewCellDelegate? { get set }
    
    /// Helper function to configure the form view with the properties
    /// of the representable
    ///
    /// - Parameter representable: The Representable
    func configure(with representable: FormTableViewCellRepresentable)
    
    func assign(value: Any)
    
}
