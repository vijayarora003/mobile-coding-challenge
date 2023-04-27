//
//  CacheManager.swift
//  Assignment
//
//  Created by Vijay Arora on 26/04/23.
//  Copyright © 2023 Vijay Arora. All rights reserved.
//

import UIKit

protocol CacheManagerType {
    func setValue(_ value: Any?, forKey key: UserDefaultsKey)
    func getInt(forKey key: UserDefaultsKey) -> Int
    func getBool(forKey key: UserDefaultsKey) -> Bool
}

enum UserDefaultsKey: String {
    case pageNumber
    case hasNext
}

final class CacheManager: CacheManagerType  {
    
    static let shared = CacheManager()
    private let userDefaults = UserDefaults.standard
    
    private init() {}

    func setValue(_ value: Any?, forKey key: UserDefaultsKey) {
        userDefaults.set(value, forKey: key.rawValue)
        userDefaults.synchronize()
    }
    
    func getInt(forKey key: UserDefaultsKey) -> Int {
        return UserDefaults.standard.integer(forKey: key.rawValue)
    }
    
    func getBool(forKey key: UserDefaultsKey) -> Bool {
        return UserDefaults.standard.bool(forKey: key.rawValue)
    }
}
