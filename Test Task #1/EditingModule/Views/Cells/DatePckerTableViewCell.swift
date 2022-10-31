//
//  DatePckerTableViewCell.swift
//  Test Task #1
//
//  Created by TestTest on 30.10.2022.
//

import UIKit

class DatePckerTableViewCell: UITableViewCell {
    
    private let nameLabel = UILabel()
   
    static var idDataPickerCell = "idDataPickerCell"
    
    private let datePicker: UIDatePicker = {
       let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.maximumDate = Date()
        datePicker.subviews[0].subviews[0].subviews[0].alpha = 0
        return datePicker
    }()
    
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
        contentView.addView(datePicker)
    }
    
    public func configure(name: String) {
        nameLabel.text = name
       
    }
}

// MARK: - Set Constraints

extension DatePckerTableViewCell {
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.35),
            
            datePicker.centerYAnchor.constraint(equalTo: centerYAnchor),
            datePicker.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
            
        ])
    }
}


