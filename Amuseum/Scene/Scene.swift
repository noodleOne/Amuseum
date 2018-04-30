//
//  Scene.swift
//  Amuseum
//
//  Created by Serj Agopian on 4/21/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import UIKit

enum Scene {
    
    case splash
    case login
    case registration
    case home
    case history(EntertainmentType)
    
    func viewController() -> UIViewController {
        switch self {
        case .splash:
            var vc = SplashViewController()
            vc.bind(to: SplashViewModel())
            return vc
        case .login:
            var vc = LoginViewController()
            vc.bind(to: LoginViewModel())
            vc.modalTransitionStyle = .crossDissolve
            return vc
        case .registration:
            var vc = RegistrationViewController()
            vc.bind(to: RegistrationViewModel())
            vc.modalTransitionStyle = .partialCurl
            return vc
        case .home:
            var vc = HomeViewController()
            vc.bind(to: HomeViewModel())
            vc.modalTransitionStyle = .flipHorizontal
            vc.title = "Amuseum"
            let navigationController = UINavigationController(rootViewController: vc)
            return navigationController
        case .history(let entertainmentType):
            var vc: UIViewController
            switch entertainmentType {
            case .movie, .series:
                vc = HistoryViewController<Movie>()
                var newVc = vc as! HistoryViewController<Movie>
                newVc.bind(to: HistoryViewModel(entertainmentType: entertainmentType))
            case .music:
                vc = HistoryViewController<Music>()
                var newVc = vc as! HistoryViewController<Music>
                newVc.bind(to: HistoryViewModel(entertainmentType: entertainmentType))
            case .books:
                vc = HistoryViewController<Book>()
                var newVc = vc as! HistoryViewController<Book>
                newVc.bind(to: HistoryViewModel(entertainmentType: entertainmentType))
            case .articles:
                vc = HistoryViewController<Article>()
                var newVc = vc as! HistoryViewController<Article>
                newVc.bind(to: HistoryViewModel(entertainmentType: entertainmentType))
            }
            vc.title = entertainmentType.rawValue.capitalizingFirstLetter()
            return vc
        }
    }
    
}
