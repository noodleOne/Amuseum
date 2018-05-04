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
    // Can't declare second parameter to be of type Media since Media has an
    // associated value and can't be used. Best solution is to have as Any and cast to appropriate type
    case mediaDetails(EntertainmentType, Any)
    
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
            var vc = HistoryViewController()
            switch entertainmentType {
            case .movie, .series:
                vc.bind(to: HistoryViewModel<Movie>(entertainmentType: entertainmentType))
            case .music:
                vc.bind(to: HistoryViewModel<Music>(entertainmentType: entertainmentType))
            case .books:
                vc.bind(to: HistoryViewModel<Book>(entertainmentType: entertainmentType))
            case .articles:
                vc.bind(to: HistoryViewModel<Article>(entertainmentType: entertainmentType))
            }
            vc.title = entertainmentType.rawValue.capitalizingFirstLetter()
            return vc
        case .mediaDetails(let entertainmentType, let model):
            var vc = MediaDetailsViewController(rows: FormTableViewProvider(entertainmentType: entertainmentType).getRows())
            switch entertainmentType {
            case .movie, .series:
                guard let movie = model as? Movie else {
                    fatalError("Didn't pass a movie object while trying to instantiate movie MediaDetailsViewController")
                }
                vc.bind(to: MediaDetailsViewModel<Movie>(model: movie, entertainmentType: entertainmentType))
            case .music:
                guard let music = model as? Music else {
                    fatalError("Didn't pass a Music object while trying to instantiate Music MediaDetailsViewController")
                }
                vc.bind(to: MediaDetailsViewModel<Music>(model: music, entertainmentType: entertainmentType))
            case .books:
                guard let book = model as? Book else {
                    fatalError("Didn't pass a Book object while trying to instantiate Book MediaDetailsViewController")
                }
                vc.bind(to: MediaDetailsViewModel<Book>(model: book, entertainmentType: entertainmentType))
            case .articles:
                guard let article = model as? Article else {
                    fatalError("Didn't pass a Article object while trying to instantiate Article MediaDetailsViewController")
                }
                vc.bind(to: MediaDetailsViewModel<Article>(model: article, entertainmentType: entertainmentType))
            }
            return vc
        }
    }
    
}
