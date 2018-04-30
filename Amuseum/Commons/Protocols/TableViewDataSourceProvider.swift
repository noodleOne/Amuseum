//
//  TableViewDataSourceProvider.swift
//  Amuseum
//
//  Created by Serj Agopian on 4/21/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import Foundation
import UIKit

protocol TableViewDataSourceProvider {
    
    associatedtype CellRepresentable
    
    var viewModels: [CellRepresentable] { get }
    
    func action(for indexPath: IndexPath) -> UIViewController
    
}

extension TableViewDataSourceProvider {
    
    func cellModel(for indexPath: IndexPath) -> CellRepresentable {
        return viewModels[indexPath.item]
    }
    
    func numberOfItems() -> Int {
        return viewModels.count
    }
    
}
