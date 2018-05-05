//
//  FormPickerTableViewCell.swift
//  Amuseum
//
//  Created by Serj Agopian on 5/2/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import UIKit

class FormPickerTableViewCell: UITableViewCell, FormTableViewCellConfigurable {

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
            }
        } else {
            pickerHeightConstraint.constant = 0
            UIView.animate(withDuration: 0.25) {
                self.formTitleLabel.isHidden = false
                self.formValueLabel.textColor = .lightGray
            }
        }
    }
    
    // MARK: - FormTableViewCellConfigurable
    internal var key: String = ""
    weak var delegate: FormTableViewCellDelegate?
    
    func configure(with representable: FormTableViewCellRepresentable) {
        formTitleLabel.text = representable.formTitle
        formTitleLabel.font = representable.formTitleFont
        formTitleLabel.textColor = representable.formTitleColor
        formValueLabel.text = "Pick One"
        guard let options = representable.options else { return }
        pickerRows = options
        pickerView.reloadComponent(0)
        let row = options.count / 2
        pickerView.selectRow(row, inComponent: 0, animated: false)
        key = representable.key
    }
    
    func assign(value: Any) {
        guard let value = value as? String else { return }
        formValueLabel.text = value
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
        let value = pickerRows[row]
        formValueLabel.text = value
        delegate?.formValue(value, forKey: key)
    }
    
}
