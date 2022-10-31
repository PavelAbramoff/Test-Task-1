//
//  GenderTextField.swift
//  Test Task #1
//
//  Created by TestTest on 31.10.2022.
//

import UIKit

class GenderTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        placeholder = "Введите данные"
        textAlignment = .right
        tintColor = .clear
        font = Resources.Fonts.avenirNextRegular(with: 18)
        attributedPlaceholder = NSAttributedString(string: "Данные", attributes: [.foregroundColor : UIColor.lightGray, .font: font as Any])
    }
    
    override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        !isFirstResponder
    }
}
