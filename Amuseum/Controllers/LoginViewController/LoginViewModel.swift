//
//  LoginViewModel.swift
//  Amuseum
//
//  Created by Serj Agopian on 4/20/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import Foundation
import FirebaseAuth

enum LoginState {
    case cantLogin
    case canLogin
    case loggingIn
    case loggedIn
    case error(error: Error)
}

protocol LoginViewModelInput {
    var emailText: String { set get }
    var passwordText: String { set get }
}

protocol LoginViewModelOutput {
    
    typealias ValidationHandler = ((Bool) -> Void)?
    typealias LoginStateHandler = ((LoginState) -> Void)?
    
    var loginState: LoginStateHandler { set get }
    var emailIsValid: ValidationHandler { set get }
    var passwordIsValid: ValidationHandler { set get }
}

class LoginViewModel: LoginViewModelInput, LoginViewModelOutput {
    
    // MARK: - Inputs
    var emailText: String {
        didSet {
            isValidEmail = emailText.isEmail
            emailIsValid?(isValidEmail)
        }
    }
    var passwordText: String {
        didSet {
            isValidPassword = passwordText.count > 5
            passwordIsValid?(isValidPassword)
        }
    }
    
    // MARK: - Outputs
    var loginState: LoginStateHandler = nil {
        // On didSet call the closure to give initial state
        didSet {
            loginState?(.cantLogin)
        }
    }
    var emailIsValid: ValidationHandler = nil {
        // On didSet call the closure to give initial state
        didSet {
            emailIsValid?(false)
        }
    }
    var passwordIsValid: ValidationHandler = nil  {
        // On didSet call the closure to give initial state
        didSet {
            emailIsValid?(false)
        }
    }
    
    // MARK: Inputs & Outputs
    var inputs: LoginViewModelInput { return self }
    var outputs: LoginViewModelOutput { return self }
    
    // MARK: - Properties
    private var isValidEmail: Bool = false {
        didSet {
            loginState?(isValidEmail && isValidPassword == true ? .canLogin : .cantLogin)
        }
    }
    private var isValidPassword: Bool = false {
        didSet {
            loginState?(isValidEmail && isValidPassword == true ? .canLogin : .cantLogin)
        }
    }
    
    
    // MARK: - Initializer
    init() {
        self.emailText = ""
        self.passwordText = ""
    }
    
    func login() {
        loginState?(.loggingIn)
        Auth.auth().signIn(withEmail: emailText, password: passwordText) { [weak self] (user, error) in
            guard let `self` = self else { return }
            if let error = error {
                self.loginState?(.error(error: error))
                return
            }
            guard let _ = user else {
                self.loginState?(.error(error: LoginError.couldNotRetrieveUser))
                return
            }
            self.loginState?(.loggedIn)
        }
    }
    
}

enum LoginError: Error, LocalizedError {
    
    case couldNotRetrieveUser
    
    var localizedDescription: String {
        return "Could not retrieve user"
    }
}
