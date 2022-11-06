//
//  UserDefaultsHelper.swift
//  Test Task #1
//
//  Created by TestTest on 01.11.2022.
//

import Foundation

final class UserDefaultsHelper {
    
    private static let defaults = UserDefaults.standard
    private static let userSessionKey = "userKey"
    
    static func getUserDictionary() -> [String : String] {
        defaults.value(forKey: userSessionKey) as? [String : String] ?? [:]
    }
    
    static func saveUservalue(_ key: String, _ value: String) {
        var userDictionary = getUserDictionary()
        userDictionary[key] = value
        defaults.set(userDictionary, forKey: userSessionKey)
    }
    
    static func getUserModel() -> UserModel {
        var userModel = UserModel()
        
        let userDictionary = getUserDictionary()
        userModel.firstName = userDictionary[Resources.NameFields.firstName.rawValue] ?? ""
        userModel.secondName = userDictionary[Resources.NameFields.secondName.rawValue] ?? ""
        userModel.thirdName = userDictionary[Resources.NameFields.thirdName.rawValue] ?? ""
        userModel.birthsday = userDictionary[Resources.NameFields.birthsday.rawValue] ?? ""
        userModel.gender = userDictionary[Resources.NameFields.gender.rawValue] ?? ""
        return userModel
    }
    
    static func getUserValue(_ key: String) -> String {
        
        let userdictionary = getUserDictionary()
        let stringValue = userdictionary[key] ?? ""
        return stringValue
    }
}
