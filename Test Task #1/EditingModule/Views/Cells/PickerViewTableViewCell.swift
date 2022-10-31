//
//  PickerViewTableViewCell.swift
//  Test Task #1
//
//  Created by TestTest on 31.10.2022.
//

import UIKit

class PickerViewTableViewCell: UITableViewCell {
    
    static var idPickerView = "idPickerView"
    
    private let nameLabel = UILabel()
    private let genderPickerView = GenderPickerView()
   private let genderTextField = GenderTextField()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        selectionStyle = .none
        
        nameLabel.font = Resources.Fonts.avenirNextRegular(with: 18)
        addView(nameLabel)
        
        genderPickerView.genderDelegate = self
        genderTextField.inputView = genderPickerView
        contentView.addView(genderTextField)
    }
    
    public func configure(name: String) {
        nameLabel.text = name
       
    }
}

extension PickerViewTableViewCell: GenderPickerViewProtocol {
    func didSelect(row: Int) {
        genderTextField.text = Resources.Gender.allCases[row].rawValue
        genderTextField.resignFirstResponder()
    }
    
    
}

// MARK: - Set Constraints

extension PickerViewTableViewCell {
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.35),
            
            genderTextField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            genderTextField.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10),
            genderTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -17),
            genderTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -5)
        
        ])
    }
}



