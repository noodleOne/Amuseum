//
//  HomeViewController.swift
//  Amuseum
//
//  Created by Serj Agopian on 4/21/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, ViewModelBindable {
    
    // MARK: - View Model
    var viewModel: HomeViewModel!
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.separatorStyle = .singleLine
            tableView.tableFooterView = UIView(frame: .zero)
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.className)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func bindViewModel() {
        
    }

}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.cellModel(for: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.className, for: indexPath)
        cell.configure(with: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = viewModel.action(for: indexPath)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
