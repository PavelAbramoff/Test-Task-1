//
//  EditingTableView.swift
//  Test Task #1
//
//  Created by TestTest on 01.11.2022.
//

import UIKit

final class EditingTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        register(TextViewTableViewCell.self, forCellReuseIdentifier: TextViewTableViewCell.idTextViewCell)
        register(DatePckerTableViewCell.self, forCellReuseIdentifier: DatePckerTableViewCell.idDataPickerCell)
        register(PickerViewTableViewCell.self, forCellReuseIdentifier: PickerViewTableViewCell.idPickerView)
        
        delegate = self
        dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: UITableViewDataSource

extension EditingTableView: UITableViewDataSource {
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Resources.NameFields.allCases.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let nameFields = Resources.NameFields.allCases[indexPath.row].rawValue
        
        switch indexPath.row {
        
        case 0...2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TextViewTableViewCell.idTextViewCell, for: indexPath) as? TextViewTableViewCell else {
                return UITableViewCell()
            }
            cell.nameTextViewDelegate = self
            if indexPath.row == 1 {
                cell.configure(name: nameFields, scrollEnable: false)
            } else {
                cell.configure(name: nameFields, scrollEnable: true)
            }
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DatePckerTableViewCell.idDataPickerCell, for: indexPath) as? DatePckerTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(name: nameFields)
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PickerViewTableViewCell.idPickerView, for: indexPath) as? PickerViewTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(name: nameFields)
            return cell
        default:
            return UITableViewCell()
        }
    }
}

// MARK: UITableViewDelegate

extension EditingTableView: UITableViewDelegate {
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.row == 1 ? UITableView.automaticDimension : 44
    }
}

extension EditingTableView: NameTextViewProtocol {
    func changeSize() {
       beginUpdates()
       endUpdates()
    }
}
