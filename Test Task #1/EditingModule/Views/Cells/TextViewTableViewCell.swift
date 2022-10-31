//
//  TextViewTableViewCell.swift
//  Test Task #1
//
//  Created by TestTest on 28.10.2022.
//

import UIKit

protocol NameTextViewProtocol: AnyObject {
    func changeSize()
}

class TextViewTableViewCell: UITableViewCell {
    
    weak var nameTextViewDelegate: NameTextViewProtocol?
    
    private let nameLabel = UILabel()
    private let nameTextView = NameTextView()
   
    static var idTextViewCell = "idTextViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
        textViewDidChange(nameTextView)
        layoutIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        selectionStyle = .none
        
        nameLabel.font = Resources.Fonts.avenirNextRegular(with: 18)
        addView(nameLabel)
        contentView.addView(nameTextView)
        nameTextView.delegate = self
    }
    
    public func configure(name: String, scrollEnable: Bool) {
        nameLabel.text = name
        nameTextView.isScrollEnabled = scrollEnable
    }
}

// MARK: - UITextViewDelegate

extension TextViewTableViewCell: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
       contentView.heightAnchor.constraint(equalTo: nameTextView.heightAnchor, multiplier: 1).isActive = true
        nameTextViewDelegate?.changeSize()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Введите данные"
            textView.textColor = .lightGray
        }
    }
}

// MARK: - Set Constraints

extension TextViewTableViewCell {
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.35),
            
            nameTextView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            nameTextView.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10),
            nameTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
    }
}

