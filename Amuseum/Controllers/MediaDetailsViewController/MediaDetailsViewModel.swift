//
//  MediaDetailsViewModel.swift
//  Amuseum
//
//  Created by Serj Agopian on 5/2/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import Foundation

protocol MediaDetailsViewModelDatasource {
    
    /*func numberOfSections() -> Int
    
    func numberOfItems(for section: Int) -> Int
    
    func cellViewModel(for indexPath: IndexPath) -> FormTableViewCellRepresentable*/
    
}

class MediaDetailsViewModel<Model: Media> {
    
    // MARK: - Properties
    private let model: Model?
    private let entertainmentType: EntertainmentType
    
    // MARK: - Initializer
    init(model: Model?, entertainmentType: EntertainmentType) {
        self.model = model
        self.entertainmentType = entertainmentType
    }
    
}

// MARK: - MediaDetailsViewModelDatasource
extension MediaDetailsViewModel: MediaDetailsViewModelDatasource {
    
    /*func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfItems(for section: Int) -> Int {
        return rows.count
    }
    
    func cellViewModel(for indexPath: IndexPath) -> FormTableViewCellRepresentable {
        return rows[indexPath.row]
    }*/
    
}
