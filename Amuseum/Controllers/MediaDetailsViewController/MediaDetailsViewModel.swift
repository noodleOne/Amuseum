//
//  MediaDetailsViewModel.swift
//  Amuseum
//
//  Created by Serj Agopian on 5/2/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import Firebase
import Foundation
import CodableFirebase

protocol MediaDetailsViewModelDatasource {
    
    typealias SaveHandler = ((_ success: Bool) -> Void)?
    
    func save(completion: SaveHandler)
    
    func value(for key: String) -> Any
    
    func setValue(_ value: Any, forKey key: String)
    
}

class MediaDetailsViewModel<Model: Media> {
    
    // MARK: - Properties
    private var model: Model
    private let entertainmentType: EntertainmentType
    
    // MARK: - Firebase
    private lazy var mediaCollection = Firestore.firestore().collection(FirebaseManager.CollectionNames.media.name)
    
    // MARK: - Initializer
    init(model: Model, entertainmentType: EntertainmentType) {
        self.model = model
        self.entertainmentType = entertainmentType
    }
    
}

// MARK: - MediaDetailsViewModelDatasource
extension MediaDetailsViewModel: MediaDetailsViewModelDatasource {
    
    func save(completion: MediaDetailsViewModelDatasource.SaveHandler) {
        model.creationDate = Date()
        let encoder = FirestoreEncoder()
        guard let data = try? encoder.encode(model) else {
            completion?(false)
            return
        }
        guard let dict = data as? [String: Any] else {
            completion?(false)
            return
        }
        mediaCollection.addDocument(data: dict) { (error) in
            if let error = error {
                print(error)
                return
            }
            completion?(true)
        }
    }
    
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
            if let rawValue = value as? Model.Genre.RawValue, let genre = Model.Genre.init(rawValue: rawValue) {
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
