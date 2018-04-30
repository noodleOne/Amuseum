//
//  RegistrationViewModel.swift
//  Amuseum
//
//  Created by Serj Agopian on 4/21/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import Foundation
import FirebaseAuth

// MARK: - Enum Definitions
enum RegistrationState {
    case cantRegister
    case canRegister
    case registering
    case registered
    case error(error: Error)
}

enum RegistrationError: Error, LocalizedError {
    
    case couldNotCreateUser
    
    var localizedDescription: String {
        return "Could not create user"
    }
}

// MARK: - Protocol definitions
protocol RegistrationViewModelInput {
    var emailText: String { set get }
    var passwordText: String { set get }
}

protocol RegistrationViewModelOutput {
    
    typealias ValidationHandler = ((Bool) -> Void)?
    typealias RegistrationStateHandler = ((RegistrationState) -> Void)?
    
    var emailIsValid: ValidationHandler { set get }
    var passwordIsValid: ValidationHandler { set get }
    var registrationState: RegistrationStateHandler { set get }
}

// MARK: - Class Definition
class RegistrationViewModel: RegistrationViewModelInput, RegistrationViewModelOutput {
    
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
    var emailIsValid: ValidationHandler = nil
    var passwordIsValid: ValidationHandler = nil
    var registrationState: RegistrationStateHandler = nil
    
    // MARK: Inputs & Outputs
    var inputs: RegistrationViewModelInput { return self }
    var outputs: RegistrationViewModelOutput { return self }
    
    // MARK: - Properties
    private var isValidEmail: Bool = false {
        didSet {
            registrationState?(isValidEmail && isValidPassword == true ? .canRegister : .cantRegister)
        }
    }
    private var isValidPassword: Bool = false {
        didSet {
            registrationState?(isValidEmail && isValidPassword == true ? .canRegister : .cantRegister)
        }
    }
    
    
    // MARK: - Initializer
    init() {
        self.emailText = ""
        self.passwordText = ""
    }
    
    func register() {
        registrationState?(.registering)
        Auth.auth().createUser(withEmail: emailText, password: passwordText) { [weak self] (user, error) in
            guard let `self` = self else { return }
            if let error = error {
                self.registrationState?(.error(error: error))
                return
            }
            guard let _ = user else {
                self.registrationState?(.error(error: RegistrationError.couldNotCreateUser))
                return
            }
            self.registrationState?(.registered)
        }
    }
    
}
