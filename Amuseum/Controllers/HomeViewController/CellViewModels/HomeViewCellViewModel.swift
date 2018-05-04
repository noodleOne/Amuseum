//
//  HomeViewCellViewModel.swift
//  Amuseum
//
//  Created by Serj Agopian on 4/21/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import UIKit

class HomeViewCellViewModel {
    
    let entertainmentType: EntertainmentType
    
    init(entertainmentType: EntertainmentType) {
        self.entertainmentType = entertainmentType
    }
    
}

extension HomeViewCellViewModel: DefaultUITableViewCellRepresentable {
    
    var font: UIFont {
        return .systemFont(ofSize: 16.0, weight: .medium)
    }
    
    var title: String {
        return entertainmentType.rawValue.capitalizingFirstLetter()
    }
    
    var subtitle: String? {
        return nil
    }
    
    var titleColor: UIColor {
        return UIColor.CSS.darkSlateGrey
    }
    
    var subtitleColor: UIColor? {
        return nil
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
