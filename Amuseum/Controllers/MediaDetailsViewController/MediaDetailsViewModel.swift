//
//  MediaDetailsViewModel.swift
//  Amuseum
//
//  Created by Serj Agopian on 5/2/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import Foundation

protocol MediaDetailsViewModelDatasource {
    
    func value(for key: String) -> Any
    
    func setValue(_ value: Any, forKey key: String)
    
}

class MediaDetailsViewModel<Model: Media> {
    
    // MARK: - Properties
    private var model: Model
    private let entertainmentType: EntertainmentType
    
    // MARK: - Initializer
    init(model: Model, entertainmentType: EntertainmentType) {
        self.model = model
        self.entertainmentType = entertainmentType
    }
    
}

// MARK: - MediaDetailsViewModelDatasource
extension MediaDetailsViewModel: MediaDetailsViewModelDatasource {
    
    func value(for key: String) -> Any {
        guard let value = try? model.get(key: key) else {
            return ""
        }
        if let caseValue = value as? Model.Genre {
            return caseValue.rawValue
        }
        return value
    }
    
    func setValue(_ value: Any, forKey key: String) {
        do {
            if let _ = try? model.get(key: key) as? Model.Genre, let value = value as? Model.Genre.RawValue {
                guard let genre = Model.Genre.init(rawValue: value) else { return }
                try model.set(value: genre, key: key)
                print(genre)
                return
            }
            try model.set(value: value, key: key)
            print(value)
        } catch {
            print(error)
        }
    }
    
}
