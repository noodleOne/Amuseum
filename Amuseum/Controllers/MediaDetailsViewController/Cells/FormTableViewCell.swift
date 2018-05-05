//
//  FormTableViewCell.swift
//  Amuseum
//
//  Created by Serj Agopian on 5/2/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import UIKit

class FormTableViewCell: UITableViewCell, FormTableViewCellConfigurable {
    
    // MARK: - Outlets
    @IBOutlet weak var formTitleLabel: UILabel!
    @IBOutlet weak var formTextField: UITextField!
    
    // MARK: - Initializers
    override func awakeFromNib() {
        super.awakeFromNib()
        setupTextFieldTextObserving()
    }
    
    private func setupTextFieldTextObserving() {
        formTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    // MARK: - FormTableViewCellConfigurable
    internal var key: String = ""
    weak var delegate: FormTableViewCellDelegate?
    
    func configure(with representable: FormTableViewCellRepresentable) {
        formTitleLabel.text = representable.formTitle
        formTitleLabel.font = representable.formTitleFont
        formTitleLabel.textColor = representable.formTitleColor
        key = representable.key
    }
    
    func assign(value: Any) {
        guard let value = value as? String else { return }
        formTextField.text = value
    }

}

// MARK: - Selectors
extension FormTableViewCell {
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text else { return }
        delegate?.formValue(text, forKey: key)
    }
    
}
