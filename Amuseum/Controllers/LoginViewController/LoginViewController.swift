//
//  LoginViewController.swift
//  Amuseum
//
//  Created by Serj Agopian on 4/20/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, ViewModelBindable {
    
    // MARK: - ViewModel
    internal var viewModel: LoginViewModel!
    
    // MARK: - Outlets
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFieldDelegates()
    }
    
    internal func bindViewModel() {
        var outputs = viewModel.outputs
        
        outputs.emailIsValid = { [unowned self] (isValid) in
            self.emailTextField.layer.borderColor = isValid == true ? UIColor.red.cgColor : UIColor.green.cgColor
        }
        
        outputs.passwordIsValid = { [unowned self] (isValid) in
            self.emailTextField.layer.borderColor = isValid == true ? UIColor.red.cgColor : UIColor.green.cgColor
        }
        
        outputs.loginState = { [unowned self] (state) in
            switch state {
            case .cantLogin:
                self.loginButton.isEnabled = false
            case .canLogin:
                self.loginButton.isEnabled = true
            case .loggingIn:
                self.loginButton.isEnabled = false
                self.setTextFields(false)
            case .loggedIn:
                self.present(Scene.home.viewController(), animated: true, completion: nil)
                 break
            case .error(let error):
                self.setTextFields(true)
                self.loginButton.isEnabled = true
                UIAlertController.init(error: error).showAlert()
            }
        }
    }
    
    // MARK: - Initialization Helper Methods
    private func setupTextFieldDelegates() {
        emailTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    // MARK: - Helper Methods
    private func setTextFields(_ enabled: Bool) {
        self.emailTextField.isEnabled = enabled
        self.passwordTextField.isEnabled = enabled
    }
    
    // MARK: - IBActions
    @IBAction func loginTapped(_ sender: Any) {
        viewModel.login()
    }
    

}

// MARK: - UITextFieldDelegate
extension LoginViewController {
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text else { return }
        switch textField {
        case emailTextField:
            viewModel.emailText = text
        case passwordTextField:
            viewModel.passwordText = text
        default:
            break
        }
    }
    
}