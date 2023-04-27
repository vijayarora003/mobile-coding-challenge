//
//  DependencyContainer.swift
//  Assignment
//
//  Created by Vijay Arora on 26/04/23.
//  Copyright © 2023 Vijay Arora. All rights reserved.
//

import UIKit

final class DependencyContainer {

    static let shared = DependencyContainer()
    let coreDataManager: CoreDataManagerType
    let cacheManager: CacheManagerType
    let apiReuest: APIRequestType
    
    init(coreDataManager: CoreDataManagerType = CoreDataManager.shared,
         cacheManager: CacheManagerType = CacheManager.shared,
         apiReuest: APIRequestType = APIRequest.shared) {
        self.coreDataManager = coreDataManager
        self.cacheManager = cacheManager
        self.apiReuest = apiReuest
    }
}
