//
//  FormTableViewProvider.swift
//  Amuseum
//
//  Created by Serj Agopian on 5/3/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import UIKit
import Foundation

struct FormTableViewProvider {
    
    let entertainmentType: EntertainmentType
    
    func getRows() -> [FormTableViewCellRepresentable] {
        switch entertainmentType {
        case .movie:
            return MovieRows.allCases
        case .series:
            return MovieRows.allCases
        case .music:
            return MusicRows.allCases
        case .books:
            return BookRows.allCases
        case .articles:
            return ArticleRows.allCases
        }
    }
    
    
}

private enum MovieRows: String, FormTableViewCellRepresentable {
    
    case name
    case genre
    case favoriteActor
    
    var formTitle: String {
        return self.rawValue.capitalizingFirstLetter()
    }
    
    var formTitleFont: UIFont {
        return UIFont.systemFont(ofSize: 17)
    }
    
    var formTitleColor: UIColor {
        return .black
    }
    
    var inputPlaceholder: String? {
        return self.rawValue.capitalizingFirstLetter()
    }
    
    var options: [String]? {
        switch self {
        case .name, .favoriteActor:
            return nil
        case .genre:
            return MovieGenre.allValues
        }
    }
    
    var reuseIdentifier: String {
        switch self {
        case .name, .favoriteActor:
            return FormTableViewCell.className
        case .genre:
            return FormPickerTableViewCell.className
        }
    }
}


private enum MusicRows: String, FormTableViewCellRepresentable {
    
    case name
    case genre
    case album
    case artist
    
    var formTitle: String {
        return self.rawValue.capitalizingFirstLetter()
    }
    
    var formTitleFont: UIFont {
        return UIFont.systemFont(ofSize: 17)
    }
    
    var formTitleColor: UIColor {
        return .black
    }
    
    var inputPlaceholder: String? {
        return self.rawValue.capitalizingFirstLetter()
    }
    
    var options: [String]? {
        switch self {
        case .name, .album, .artist:
            return nil
        case .genre:
            return MusicGenre.allValues
        }
    }
    
    var reuseIdentifier: String {
        switch self {
        case .name, .album, .artist:
            return FormTableViewCell.className
        case .genre:
            return FormPickerTableViewCell.className
        }
    }
    
    
}

private enum BookRows: String, FormTableViewCellRepresentable {
    
    case name
    case genre
    case author
    
    var formTitle: String {
        return self.rawValue.capitalizingFirstLetter()
    }
    
    var formTitleFont: UIFont {
        return UIFont.systemFont(ofSize: 17)
    }
    
    var formTitleColor: UIColor {
        return .black
    }
    
    var inputPlaceholder: String? {
        return self.rawValue.capitalizingFirstLetter()
    }
    
    var options: [String]? {
        switch self {
        case .name, .author:
            return nil
        case .genre:
            return BookGenre.allValues
        }
    }
    
    var reuseIdentifier: String {
        switch self {
        case .name, .author:
            return FormTableViewCell.className
        case .genre:
            return FormPickerTableViewCell.className
        }
    }
    
    
}

private enum ArticleRows: String, FormTableViewCellRepresentable {
    
    case name
    case genre
    case author
    case source
    case publishedDate
    
    var formTitle: String {
        return self.rawValue.capitalizingFirstLetter()
    }
    
    var formTitleFont: UIFont {
        return UIFont.systemFont(ofSize: 17)
    }
    
    var formTitleColor: UIColor {
        return .black
    }
    
    var inputPlaceholder: String? {
        return self.rawValue.capitalizingFirstLetter()
    }
    
    var options: [String]? {
        switch self {
        case .name, .author, .source, .publishedDate:
            return nil
        case .genre:
            return ArticleRows
                .allValues
        }
    }
    
    var reuseIdentifier: String {
        switch self {
        case .name, .author, .source, .publishedDate:
            return FormTableViewCell.className
        case .genre:
            return FormPickerTableViewCell.className
        }
    }
    
}
