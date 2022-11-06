//
//  MainTableViewController.swift
//  Test Task #1
//
//  Created by TestTest on 21.10.2022.
//

import UIKit

final class MainTableViewController: UITableViewController {
    
    private var userModel = UserModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupViews()
        getUserModel()
        tableView.register(MainTableViewCell.self,
                           forCellReuseIdentifier: MainTableViewCell.idMainTableViewCell)

    }
    
    private func setupViews() {
        title = "Просмотр"
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Редактировать",
                                                             style: .plain,
                                                             target: self,
                                                             action: #selector(editingTapped))
    }
    
    @objc private func editingTapped() {
        let editingTableViewController = EditingViewController(UserModel())
        navigationController?.pushViewController(editingTableViewController, animated: true)
    }
    
    private func getUserModel() {
        userModel = UserDefaultsHelper.getUserModel()
    }
}

extension MainTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Resources.NameFields.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.idMainTableViewCell, for: indexPath) as? MainTableViewCell else {
            return UITableViewCell()
        }
        
        let nameFields = Resources.NameFields.allCases[indexPath.row].rawValue
        cell.configure(name: nameFields)
        return cell
    }
}

extension MainTableViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.row == 1 ? UITableView.automaticDimension : 44
    }
}






