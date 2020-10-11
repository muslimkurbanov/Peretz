//
//  MenuUserSettings.swift
//  MVP-PeretzTest
//
//  Created by Муслим Курбанов on 08.10.2020.
//  Copyright © 2020 Муслим Курбанов. All rights reserved.
//

import Foundation

final class UserSettings {
    
    private enum SettingsKeys: String {
        case userName
    }
    
    static var productCount: String! {
        get {
            return UserDefaults.standard.string(forKey: SettingsKeys.userName.rawValue)

        } set {
            let defaults = UserDefaults.standard
            let key = SettingsKeys.userName.rawValue
            if let name = newValue {
                print("Value \(name) was added to key \(key)")
                defaults.set(name, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
}
