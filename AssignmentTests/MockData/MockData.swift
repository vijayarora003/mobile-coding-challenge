//
//  MockData.swift
//  AssignmentTests
//
//  Created by Vijay Arora on 27/04/23.
//  Copyright © 2023 Vijay Arora. All rights reserved.
//

import Foundation
import CoreData
@testable import Assignment

struct MockData {
    static var jsonData: Data? {
        if let url = Bundle.main.url(forResource: "MockAudioBooks", withExtension: "json") {
            return try? Data(contentsOf: url)
        }
        return nil
    }
    
    static let error = "this is test error"
    static var podcast: CDPodcast {
        let model = CDPodcast(context: MockCoreDataManager.persistentContainer.viewContext)
        model.id = "1"
        model.publisher = "publisher"
        model.title = "title"
        return model
    }
}
