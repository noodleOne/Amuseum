//
//  SplashViewController.swift
//  Amuseum
//
//  Created by Serj Agopian on 4/20/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController, ViewModelBindable {
    
    // MARK: - View Model
    var viewModel: SplashViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.checkUserState { [unowned self] (state) in
            var vc: UIViewController
            switch state {
            case .loggedOut:
                vc = Scene.login.viewController()
            case .loggedIn:
                vc = Scene.home.viewController()
            case .error(let error):
                vc = Scene.login.viewController()
                UIAlertController(error: error).showAlert()
            }
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    func bindViewModel() {
        
    }
    
}
