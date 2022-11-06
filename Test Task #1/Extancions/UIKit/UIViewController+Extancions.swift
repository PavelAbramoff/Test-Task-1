//
//  UIViewController+Extancions.swift
//  Test Task #1
//
//  Created by TestTest on 06.11.2022.
//

import UIKit

extension UIViewController {
    
    func presentSimpleAlert(title: String, message: String?) {
        
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        let okAktion = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAktion)
        present(alertController, animated: true)
    }
    
    func presentChangeAlert(completionHandler: @escaping (Bool) -> Void){
        
        let alertController = UIAlertController(title: "Данные были записанв",
                                                message: "Вы желаете сохранить изменения?",
                                                preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Сохранить", style: .default) { _ in
            completionHandler(true)
        }
        let sskipAction = UIAlertAction(title: "Пропустить", style: .default) { _ in
            completionHandler(false)
        }
        alertController.addAction(saveAction)
        alertController.addAction(sskipAction)
        present(alertController, animated: true)
        
    }
}
