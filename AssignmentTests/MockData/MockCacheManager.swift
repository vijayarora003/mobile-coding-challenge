//
//  MockCacheManager.swift
//  AssignmentTests
//
//  Created by Vijay Arora on 27/04/23.
//  Copyright © 2023 Vijay Arora. All rights reserved.
//

@testable import Assignment

final class MockCacheManager: CacheManagerType {
    
    private var dict = [String: Any]()
    
    func setValue(_ value: Any?, forKey key: Assignment.UserDefaultsKey) {
        dict[key.rawValue] = value
    }
    
    func getInt(forKey key: Assignment.UserDefaultsKey) -> Int {
        return dict[key.rawValue] as? Int ?? 0
    }
    
    func getBool(forKey key: Assignment.UserDefaultsKey) -> Bool {
        return dict[key.rawValue] as? Bool ?? false
    }
}
