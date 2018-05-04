//
//  HistoryCellViewModel.swift
//  Amuseum
//
//  Created by Serj Agopian on 4/29/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import Foundation
import UIKit

class HistoryCellViewModel<Model: Media> {
    
    let model: Model
    
    init(model: Model) {
        self.model = model
    }
    
}

extension HistoryCellViewModel: DefaultUITableViewCellRepresentable {
    
    var font: UIFont {
        return .systemFont(ofSize: 16.0, weight: .medium)
    }
    
    var title: String {
        return model.name
    }
    
    var subtitle: String? {
        return (model.genre.rawValue as! String)
    }
    
    var titleColor: UIColor {
        return UIColor.CSS.darkSlateGrey
    }
    
    var subtitleColor: UIColor? {
        return UIColor.CSS.lightGray
    }
    
    var reuseIdentifier: String {
        return UITableViewCell.className
    }
    
    var backgroundColor: UIColor {
        return .white
    }
    
    var accessoryType: UITableViewCellAccessoryType {
        return .disclosureIndicator
    }
    
}
