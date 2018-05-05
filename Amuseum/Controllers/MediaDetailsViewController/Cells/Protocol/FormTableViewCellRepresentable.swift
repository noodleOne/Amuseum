//
//  FormTableViewCellRepresentable.swift
//  Amuseum
//
//  Created by Serj Agopian on 5/3/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import UIKit

protocol FormTableViewCellRepresentable {
    
    /// The key the form represents
    var key: String { get }
    
    /// The title of the input the user will insert
    var formTitle: String { get }
    
    /// The title of the form title
    var formTitleFont: UIFont { get }
    
    /// The Color of the form title
    var formTitleColor: UIColor { get }
    
    /// The place holder of the TextField
    var inputPlaceholder: String? { get }
    
    /// The designated row reuse identifier
    /// So that the table view can reuse cells of type
    /// FormTableViewCell and FormPickerTableViewCell
    var reuseIdentifier: String { get }
    
    /// The options the user can picker from a picker view
    var options: [String]? { get }
    
}
