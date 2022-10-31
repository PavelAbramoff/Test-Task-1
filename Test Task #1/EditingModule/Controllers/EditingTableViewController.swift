//
//  EditingTableViewController.swift
//  Test Task #1
//
//  Created by TestTest on 21.10.2022.
//

import UIKit

final class EditingTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        tableView.register(TextViewTableViewCell.self, forCellReuseIdentifier: TextViewTableViewCell.idTextViewCell)
        tableView.register(DatePckerTableViewCell.self, forCellReuseIdentifier: DatePckerTableViewCell.idDataPickerCell)
        tableView.register(PickerViewTableViewCell.self, forCellReuseIdentifier: PickerViewTableViewCell.idPickerView)
    }
    
    private func setupViews() {
        title = "Редактирование"
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(editingTapped))
    }
    
    @objc private func editingTapped() {
        let editingTableViewController = EditingTableViewController()
        navigationItem.backButtonTitle = "Назад"
        navigationController?.pushViewController(editingTableViewController, animated: true)
    }
}

extension EditingTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Resources.NameFields.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
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

extension EditingTableViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.row == 1 ? UITableView.automaticDimension : 44
    }
}

extension EditingTableViewController: NameTextViewProtocol {
    func changeSize() {
        tableView.beginUpdates()
        tableView.endUpdates()
    }
}
