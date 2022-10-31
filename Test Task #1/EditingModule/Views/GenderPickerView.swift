//
//  GenderPickerView.swift
//  Test Task #1
//
//  Created by TestTest on 31.10.2022.
//

import UIKit

protocol GenderPickerViewProtocol: AnyObject {
    func didSelect(row: Int)
}

class GenderPickerView: UIPickerView {
    
    weak var genderDelegate: GenderPickerViewProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        delegate = self
        dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GenderPickerView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        Resources.Gender.allCases.count
    }
}

extension GenderPickerView: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        Resources.Gender.allCases[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        genderDelegate?.didSelect(row: row)
    }
}
