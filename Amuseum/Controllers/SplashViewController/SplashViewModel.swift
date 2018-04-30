//
//  SplashViewModel.swift
//  Amuseum
//
//  Created by Serj Agopian on 4/21/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import Foundation
import FirebaseAuth

enum UserState {
    case loggedOut
    case loggedIn
    case error(Error)
}

class SplashViewModel {
    
    typealias UserStateCompletion = (UserState) -> Void
    
    func checkUserState(with completion: @escaping UserStateCompletion) {
        if let user = Auth.auth().currentUser {
            user.getIDToken { (token, error) in
                if let error = error {
                    completion(.error(error))
                    return
                }
                completion(.loggedIn)
            }
        } else {
            completion(.loggedOut)
        }
    }
    
}
