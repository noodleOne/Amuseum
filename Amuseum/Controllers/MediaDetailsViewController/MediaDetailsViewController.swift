//
//  MediaDetailsViewController.swift
//  Amuseum
//
//  Created by Serj Agopian on 5/2/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import UIKit

class MediaDetailsViewController: UIViewController, ViewModelBindable {
    
    // MARK: - Properties
    let rows: [FormTableViewCellRepresentable]
    var valueForRow: [String: Any] = [:]
    
    // MARK: View Model
    var viewModel: MediaDetailsViewModelDatasource!
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.allowsMultipleSelection = true
            tableView.tableFooterView = UIView(frame: .zero)
            tableView.register(UINib(nibName: FormTableViewCell.className, bundle: nil), forCellReuseIdentifier: FormTableViewCell.className)
            tableView.register(UINib(nibName: FormPickerTableViewCell.className, bundle: nil), forCellReuseIdentifier: FormPickerTableViewCell.className)
        }
    }
    
    // MARK: - Initializers
    init(rows: [FormTableViewCellRepresentable]) {
        self.rows = rows
        super.init(nibName: "MediaDetailsViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - View Model Binding
    func bindViewModel() {
        
    }
    
}

// MARK: UITableViewDelegate, UITableViewDatasource
extension MediaDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: row.reuseIdentifier, for: indexPath)
        if var configurable = cell as? FormTableViewCellConfigurable {
            configurable.configure(with: row)
            configurable.delegate = self
            configurable.assign(value: viewModel.value(for: row.key))
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // This allows the update of the row heights
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        let row = rows[indexPath.row]
        return row.options != nil
    }
    
}

// MAKR: - FormTableViewCellDelegate
extension MediaDetailsViewController: FormTableViewCellDelegate {
    
    func formValue(_ value: Any, forKey key: String) {
        viewModel.setValue(value, forKey: key)
    }
    
    
}
