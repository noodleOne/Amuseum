//
//  FormPickerTableViewCell.swift
//  Amuseum
//
//  Created by Serj Agopian on 5/2/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import UIKit

class FormPickerTableViewCell: UITableViewCell, ViewModelBindable, FormTableViewCellConfigurable {
    
    // MARK: - View Model
    var viewModel: FormPickerTableViewCellViewModel!
    
    // MARK: - Properties
    private var pickerRows: [String] = []
    
    // MARK: - Outlets
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var formValueLabel: UILabel!
    @IBOutlet weak var formTitleLabel: UILabel!
    @IBOutlet weak var pickerHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var pickerView: UIPickerView! {
        didSet {
            pickerView.delegate = self
            pickerView.dataSource = self
        }
    }
    
    // MARK: - Cell Initializer
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - override methods
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            pickerHeightConstraint.constant = 150
            UIView.animate(withDuration: 0.25) {
                self.formTitleLabel.isHidden = true
                self.formValueLabel.textColor = .blue
                self.layoutIfNeeded()
            }
        } else {
            pickerHeightConstraint.constant = 0
            UIView.animate(withDuration: 0.25) {
                self.formTitleLabel.isHidden = false
                self.formValueLabel.textColor = .lightGray
                self.layoutIfNeeded()
            }
        }
    }
    
    // MARK: - View Model Binding
    func bindViewModel() {
        
    }
    
    func configure(with representable: FormTableViewCellRepresentable) {
        formTitleLabel.text = representable.formTitle
        formTitleLabel.font = representable.formTitleFont
        formTitleLabel.textColor = representable.formTitleColor
        formValueLabel.text = "Pick One"
        guard let options = representable.options else { return }
        pickerRows = options
        pickerView.reloadComponent(0)
    }
    
}

// MARK: - UIPickerViewDelegate, UIPickerViewDataSource
extension FormPickerTableViewCell: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerRows.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerRows[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        formValueLabel.text = pickerRows[row]
    }
    
}
