//
//  ViewModelBindable.swift
//  Amuseum
//
//  Created by Serj Agopian on 4/20/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import UIKit

/// Any View conforming to the ViewModelBindable protocol
/// will declare a view model variable and provide a bindViewModel() function
/// to be called once the viewModel variable is assigned.
/// Credits for this idea from https://github.com/jdisho/Papr
protocol ViewModelBindable {
    associatedtype ViewModelType
    
    /// The view model related to the view
    var viewModel: ViewModelType! { get set }
    
    /// Method called to bind all observers to UI Elements and actions to the view model
    func bindViewModel()
    
}


// MARK: - ViewModelBindable extension where the view is a UIViewController
extension ViewModelBindable where Self: UIViewController {
    
    mutating func bind(to viewModel: Self.ViewModelType) {
        self.viewModel = viewModel
        loadViewIfNeeded()
        bindViewModel()
    }
    
}

// MARK: - ViewModelBindable extension where the view is a UITableViewCell
extension ViewModelBindable where Self: UITableViewCell {
    
    mutating func bind(to viewModel: Self.ViewModelType) {
        self.viewModel = viewModel
        bindViewModel()
    }
    
}

// MARK: - ViewModelBindable extension where the view is a UICollectionViewCell
extension ViewModelBindable where Self: UICollectionViewCell {
    
    mutating func bind(to viewModel: Self.ViewModelType) {
        self.viewModel = viewModel
        bindViewModel()
    }
    
}
