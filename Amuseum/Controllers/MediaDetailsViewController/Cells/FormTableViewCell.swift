//
//  FormTableViewCell.swift
//  Amuseum
//
//  Created by Serj Agopian on 5/2/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import UIKit

class FormTableViewCell: UITableViewCell, ViewModelBindable, FormTableViewCellConfigurable {
    
    // MARK: - View Model
    var viewModel: FormTableViewCellViewModel!
    
    // MARK: - Outlets
    @IBOutlet weak var formTitleLabel: UILabel!
    @IBOutlet weak var formTextField: UITextField!
    
    // MARK: - Initializers
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - View Model Binding
    func bindViewModel() {
        
    }
    
    // MARK: - Configurable conformance
    func configure(with representable: FormTableViewCellRepresentable) {
        formTitleLabel.text = representable.formTitle
        formTitleLabel.font = representable.formTitleFont
        formTitleLabel.textColor = representable.formTitleColor
    }

}
