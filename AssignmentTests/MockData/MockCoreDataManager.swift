//
//  MockCoreDataManager.swift
//  AssignmentTests
//
//  Created by Vijay Arora on 27/04/23.
//  Copyright © 2023 Vijay Arora. All rights reserved.
//

@testable import Assignment
import CoreData

final class MockCoreDataManager: CoreDataManagerType {

    var podcastRecords = [Int: [Podcast]]()
    
    static var persistentContainer: NSPersistentContainer = {
        let description = NSPersistentStoreDescription()
        description.url = URL(fileURLWithPath: "/dev/null")
        description.type = NSInMemoryStoreType
        let container = NSPersistentContainer(name: "Assignment")
        container.persistentStoreDescriptions = [description]
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    func saveRecord(podcasts: [Podcast], page: Int?) {
        if let page = page {
            podcastRecords[page] = podcasts
        }
    }
    
    func favourite(model: CDPodcast?, isFavourite: Bool) {
        model?.isFavourite = isFavourite
    }
}
