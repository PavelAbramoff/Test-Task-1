//
//  Resources.swift
//  Test Task #1
//
//  Created by TestTest on 21.10.2022.
//

import UIKit

enum Resources {
    
    enum NameFields: String, CaseIterable {
        case firstName = "Имя"
        case secondName = "Фамилия"
        case thirdName = "Отчество"
        case dataBirthsday = "Дата рождения"
        case gender = "Пол"
    }
    
    enum Gender: String, CaseIterable {
        case noSpecified = "Не указано"
        case man = "Мужской"
        case women = "Женский"
    }
    
    enum Fonts {
        static func avenirNextRegular(with size: CGFloat) -> UIFont? {
            UIFont(name: "Avenir Next", size: size)
        }
    }
}
