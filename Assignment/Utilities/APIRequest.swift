//
//  APIRequest.swift
//  Assignment
//
//  Created by Vijay Arora on 27/04/23.
//  Copyright © 2023 Vijay Arora. All rights reserved.
//

import UIKit

protocol APIRequestType: AnyObject {
    func perform<T: Decodable>(path: String, with completion: @escaping (T?, String?) -> Void)
}

final class APIRequest: APIRequestType {
    
    static let shared = APIRequest()
    private init() { }
    
    func perform<T: Decodable>(path: String, with completion: @escaping (T?, String?) -> Void) {
        guard let url = URL(string: path) else {
            completion(nil, "Invalid path")
            return
        }
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: .main)
        let task = session.dataTask(with: url) { (data, _, serverError) in
            guard let data = data else {
                completion(nil, serverError?.localizedDescription)
                return
            }
            do {
                let decoder = JSONDecoder()
                completion(try decoder.decode(T.self, from: data), nil)
            } catch {
                completion(nil, error.localizedDescription)
            }
        }
        task.resume()
    }
}
