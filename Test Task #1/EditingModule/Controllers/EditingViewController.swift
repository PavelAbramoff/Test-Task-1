//
//  EditingViewController.swift
//  Test Task #1
//
//  Created by TestTest on 21.10.2022.
//

import UIKit

final class EditingViewController: UIViewController {
    
    private let editingTableView = EditingTableView()
    
    private var userModel = UserModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
    }
    
    init(_ userModel: UserModel) {
        self.userModel = userModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        title = "Редактирование"
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(saveTapped))
        let backBarButtonItem = UIBarButtonItem.createCustomButton(vc: self, selector: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backBarButtonItem
        view.addView(editingTableView)
    }
    
    
    @objc private func saveTapped() {
        if authFields() {
            presentSimpleAlert(title: "Выполнено", message: "Все поля заполнены")
        } else {
            presentSimpleAlert(title: "Ошибка", message: "Заполните поля")
        }
    }
    
    @objc private func backButtonTapped() {
        
        presentChangeAlert { value in
            if value {
                self.navigationController?.popViewController(animated: true)
            } else {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    private func authFields() -> Bool {
        if userModel.firstName != "" ||
            userModel.secondName != "" ||
            userModel.thirdName != "" ||
            userModel.birthsday != "" ||
            userModel.gender != "Не указано" {
            return true
        }
        return false
    }
}

// MARK: - Set Constraints

extension EditingViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            editingTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            editingTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            editingTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            editingTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}
