//
//  MediaDetailsViewController.swift
//  Amuseum
//
//  Created by Serj Agopian on 5/2/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import UIKit

class MediaDetailsViewController: UIViewController, ViewModelBindable, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Properties
    let rows: [FormTableViewCellRepresentable]
    
    // MARK: View Model
    var viewModel: MediaDetailsViewModelDatasource!
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
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
    
    // MARK: UITableViewDelegate, UITableViewDatasource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: row.reuseIdentifier, for: indexPath)
        return cell
    }
    
}
