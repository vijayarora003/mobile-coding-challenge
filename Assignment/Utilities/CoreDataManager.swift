//
//  CoreDataManager.swift
//  Assignment
//
//  Created by Vijay Arora on 27/04/23.
//  Copyright © 2023 Vijay Arora. All rights reserved.
//


import UIKit
import CoreData

protocol CoreDataManagerType {
    func saveRecord(podcasts: [Podcast], page: Int?)
    func favourite(model: CDPodcast?, isFavourite: Bool)
}

final class CoreDataManager: NSObject, CoreDataManagerType {
    
    static let shared = CoreDataManager()
    private override init() {}

    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "Assignment")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
    lazy var mainContext: NSManagedObjectContext = {
        let taskContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        taskContext.persistentStoreCoordinator = persistentContainer.persistentStoreCoordinator
        return taskContext
    }()
    
    lazy var backgroundContext: NSManagedObjectContext = {
        let privateMOC = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        privateMOC.parent = mainContext
        return privateMOC
    }()

    // MARK: - Core Data Saving support

    func saveRecord(podcasts: [Podcast], page: Int?) {
        if let page = page {
            backgroundContext.perform {
                podcasts.forEach { podcast in
                    // To enble pagination comment line 71 and 81, right now this check is handling all duplicate records by not inserting them.
                    if self.getPodcastRecord(id: podcast.id) ==  nil {
                        let record = CDPodcast(context: self.backgroundContext)
                        record.id = podcast.id
                        record.title = podcast.title
                        record.image = podcast.image
                        record.thumbnail = podcast.thumbnail
                        record.podDescription = podcast.description
                        record.publisher = podcast.publisher
                        record.page = Int32(page )
                    }
                }
                self.saveBackgroundContext()
            }
        }
    }
    
    private func getPodcastRecord(id: String?) -> CDPodcast? {
        guard let id = id else { return nil }
        let fetchRequest = CDPodcast.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id = %@", id)
        fetchRequest.fetchLimit = 1
        let records = try? backgroundContext.fetch(fetchRequest)
        return records?.first
    }
    
    func favourite(model: CDPodcast?, isFavourite: Bool) {
        if let model = model {
            model.isFavourite = isFavourite
            saveBackgroundContext()
        }
    }

    private func saveBackgroundContext() {
        do {
            if backgroundContext.hasChanges {
               try backgroundContext.save()
            }
            saveMainContext()
        } catch {
            print(error)
        }
    }
    
    private func saveMainContext() {
        mainContext.performAndWait {
            do {
                try mainContext.save()
            } catch {
                print(error)
            }
        }
    }
}
