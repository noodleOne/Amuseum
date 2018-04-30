//
//  HistoryViewController.swift
//  Amuseum
//
//  Created by Serj Agopian on 4/24/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import UIKit

class HistoryViewController<Model: Media>: UIViewController, ViewModelBindable, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.tableFooterView = UIView(frame: .zero)
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.className)
        }
    }
    
    // MARK: - ViewModel
    var viewModel: HistoryViewModel<Model>!
    
    init() {
        super.init(nibName: "HistoryViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - View Model Bindable Implementation
    func bindViewModel() {
        viewModel.dataUpdates = { [unowned self] (insertIndexes, modifiedIndexes, removedIndexes) in
            if let insertedIndexes = insertIndexes {
                self.tableView.insertRows(at: insertedIndexes, with: .automatic)
            }
        }
    }
    
    // MARK: - UITableViewDelegate, UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems(forSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.className, for: indexPath)
        cell.configure(with: viewModel.item(forIndexPath: indexPath))
        return cell
    }
    
}

////////////////////////////////////////////////////////////////////////////////////////////////
// MARK: - UITableViewDelegate, UITableViewDatasource WHY COULDN'T I CONFORM WITH AN EXTENSION
////////////////////////////////////////////////////////////////////////////////////////////////

/*extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems(forSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.className, for: indexPath)
        cell.configure(with: viewModel.item(forIndexPath: indexPath))
    }
    
}*/
