//
//  RegistrationViewController.swift
//  Amuseum
//
//  Created by Serj Agopian on 4/21/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController, ViewModelBindable {
    
    // MARK: - View Model
    var viewModel: RegistrationViewModel!
    
    // MARK: - Outlets
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFieldDelegates()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        removePartialCurlTap()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // MARK: - View Model Bindable Conformance
    func bindViewModel() {
        var outputs = viewModel.outputs
        
        outputs.emailIsValid = { [unowned self] (isValid) in
            self.emailTextField.layer.borderColor = isValid == true ? UIColor.red.cgColor : UIColor.green.cgColor
        }
        
        outputs.passwordIsValid = { [unowned self] (isValid) in
            self.emailTextField.layer.borderColor = isValid == true ? UIColor.red.cgColor : UIColor.green.cgColor
        }
        
        outputs.registrationState = { [unowned self] (state) in
            switch state {
            case .cantRegister:
                self.registerButton.isEnabled = false
            case .canRegister:
                self.registerButton.isEnabled = true
            case .registering:
                self.registerButton.isEnabled = false
                self.setTextFields(false)
            case .registered:
                self.present(Scene.home.viewController(), animated: true, completion: nil)
                break
            case .error(let error):
                self.setTextFields(true)
                self.registerButton.isEnabled = true
                UIAlertController.init(error: error).showAlert()
            }
        }
        
    }
    
    // MARK: - Initialization Helper Methods
    private func setupTextFieldDelegates() {
        emailTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    private func removePartialCurlTap() {
        if let gestures = self.view.gestureRecognizers as? [UIGestureRecognizer] {
            for gesture in gestures {
                self.view.removeGestureRecognizer(gesture)
            }
        }
    }
    
    // MARK: - Helper Methods
    private func setTextFields(_ enabled: Bool) {
        self.emailTextField.isEnabled = enabled
        self.passwordTextField.isEnabled = enabled
    }
    
    // MARK: - IBActions
    @IBAction func registerTapped(_ sender: Any) {
        viewModel.register()
    }
    
    @IBAction func backTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - UITextFieldDelegate
extension RegistrationViewController {
    
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
