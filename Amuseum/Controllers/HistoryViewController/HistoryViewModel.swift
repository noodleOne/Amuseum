//
//  HistoryViewModel.swift
//  Amuseum
//
//  Created by Serj Agopian on 4/24/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import Firebase
import Foundation
import CodableFirebase

protocol HistoryViewModelOutput {
    
    typealias DataUpdates = ((_ addedIndexes: [IndexPath]?, _ modifiedIndexes: [IndexPath]?, _ removedIndexes: [IndexPath]?) -> Void)?
    
    var dataUpdates: DataUpdates { get set }
}

class HistoryViewModel<Model:Media>: HistoryViewModelOutput {
    
    // MARK: - Outputs
    var dataUpdates: HistoryViewModelOutput.DataUpdates {
        didSet {
            getMedias()
        }
    }
    
    // MARK: - Properties
    private let entertainmentType: EntertainmentType
    private var cellViewModels: [UITableViewCellRepresentable] = []
    
    // MARK: - Firebase
    private lazy var mediaCollection = Firestore.firestore().collection(FirebaseManager.CollectionNames.media.name)
    private var changeListener: ListenerRegistration?
    
    // MARK: - Initializer
    init(entertainmentType: EntertainmentType) {
        self.entertainmentType = entertainmentType
    }
    
    deinit {
        changeListener?.remove()
    }
    
    // MARK: - Helper methods
    private func getMedias() {
        changeListener = mediaCollection.whereField("entertainmentType", isEqualTo: entertainmentType.rawValue).addSnapshotListener { [weak self] (querySnapshot, error) in
            guard let `self` = self else { return }
            if let error = error {
                print("Error fetching documents because ", error.localizedDescription)
                return
            }
            guard let querySnapshot = querySnapshot else { return }
            querySnapshot.documentChanges.forEach({ (change) in
                switch change.type {
                case .added:
                    self.insertHistoryCellViewModel(withSnapshot: change.document, at: Int(change.newIndex))
                    self.dataUpdates?([IndexPath(row: Int(change.newIndex), section: 0)], nil, nil)
                    print("Added")
                case .modified:
                    print("Modified")
                case .removed:
                    self.cellViewModels.remove(at: Int(change.newIndex))
                    self.dataUpdates?(nil, nil, [IndexPath(row: Int(change.newIndex), section: 0)])
                    print("Removed")
                }
            })
        }
    }
    
    private func insertHistoryCellViewModel(withSnapshot queryDocumentSnapshot: QueryDocumentSnapshot, at index: Int) {
        guard let media = try? FirestoreDecoder().decode(Model.self, from: queryDocumentSnapshot.data()) else { return }
        cellViewModels.insert(HistoryCellViewModel(model: media), at: index)
    }
    
}

// MARK: - TableView Provider Functions
extension HistoryViewModel {
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfItems(forSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func item(forIndexPath indexPath: IndexPath) -> UITableViewCellRepresentable {
        return cellViewModels[indexPath.row]
    }
    
}


