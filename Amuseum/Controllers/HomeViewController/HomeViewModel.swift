//
//  HomeViewModel.swift
//  Amuseum
//
//  Created by Serj Agopian on 4/21/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import UIKit

class HomeViewModel {

    var cellRepresentables: [DefaultUITableViewCellRepresentable] {
        return _viewModels
    }
    
    private lazy var _viewModels: [HomeViewCellViewModel] = {
        return EntertainmentType.allCases.map({
            return HomeViewCellViewModel(entertainmentType: $0)
        })
    }()
    
    func numberOfItems() -> Int {
        return _viewModels.count
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func cellViewModel(for indexPath: IndexPath) -> DefaultUITableViewCellRepresentable {
        return cellRepresentables[indexPath.row]
    }
    
    func action(for indexPath: IndexPath) -> UIViewController {
        return Scene.history(_viewModels[indexPath.row].entertainmentType).viewController()
    }
    
}
