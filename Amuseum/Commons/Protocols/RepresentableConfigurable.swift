//
//  RepresentableConfigurable.swift
//  Amuseum
//
//  Created by Serj Agopian on 5/3/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import UIKit
import Foundation

/// A protocol that makes a view configurable by any representable
/// Usually these Representables are created and passed from a provider
protocol RepresentableConfigurable {
    
    associatedtype Representable
    
    /// Helper function to configure a view with the properties
    /// of the representable
    ///
    /// - Parameter representable: The Representable
    func configure(with representable: Representable)
    
}
