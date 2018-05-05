//
//  HistoryViewController.swift
//  Amuseum
//
//  Created by Serj Agopian on 4/24/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, ViewModelBindable {
    
    // MARK: - ViewModel
    var viewModel: HistoryViewModelDatasource!
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self 
            tableView.tableFooterView = UIView(frame: .zero)
        }
    }
    
    // MARK: - Private Views
    private lazy var addButton: UIBarButtonItem = {
        let barButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        return barButton
    }()
    
    // MARK: - Initializers
    init() {
        super.init(nibName: HistoryViewController.className, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBarButtonItems()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let selectedIndexPath = tableView.indexPathForSelectedRow else { return }
        tableView.deselectRow(at: selectedIndexPath, animated: true)
    }
    
    // MARK: - Helper Methods
    private func setupBarButtonItems() {
        navigationItem.rightBarButtonItem = addButton
    }
    
    // MARK: - View Model Bindable Implementation
    func bindViewModel() {
        viewModel.dataUpdates = { [unowned self] (insertIndexes, modifiedIndexes, removedIndexes) in
            if let insertedIndexes = insertIndexes {
                self.tableView.insertRows(at: insertedIndexes, with: .automatic)
            }
        }
    }
    
}

// MARK: - Selectors
extension HistoryViewController {
    
    @objc private func addTapped() {
        
    }
    
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems(forSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.className) ?? UITableViewCell(style: .subtitle, reuseIdentifier: UITableViewCell.className)
        cell.configure(with: viewModel.cellViewModel(for: indexPath))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = viewModel.didSelectAction(for: indexPath)
        navigationController?.pushViewController(vc, animated: true)
    }

    
}
