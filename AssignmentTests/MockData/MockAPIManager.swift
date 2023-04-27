//
//  MockAPIManager.swift
//  AssignmentTests
//
//  Created by Vijay Arora on 27/04/23.
//  Copyright © 2023 Vijay Arora. All rights reserved.
//

@testable import Assignment
import Foundation

final class MockAPIManager: APIRequestType {
    var jsonData: Data?
    var error: String?
    
    func perform<T>(path: String,
                    with completion: @escaping (T?, String?) -> Void) where T : Decodable {
        let decoder = JSONDecoder()
        if let data = jsonData, let model = try? decoder.decode(T.self, from: data) {
            completion(model, nil)
        } else {
            completion(nil, error)
        }
    }
}
