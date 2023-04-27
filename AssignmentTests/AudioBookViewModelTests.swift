//
//  AudioBookViewModelTests.swift
//  AssignmentTests
//
//  Created by Vijay Arora on 27/04/23.
//  Copyright © 2023 Vijay Arora. All rights reserved.
//

import XCTest
@testable import Assignment

final class AudioBookViewModelTests: XCTestCase {
    
    private(set) var viewModel: AudioBookViewModel!
    private(set) var factory: DependencyContainer!
    private(set) var coreDataManager: MockCoreDataManager!
    private(set) var apiManager: MockAPIManager!
    private(set) var cacheManager: MockCacheManager!
    
    override func setUp() {
        coreDataManager = MockCoreDataManager()
        apiManager = MockAPIManager()
        cacheManager = MockCacheManager()
        cacheManager.setValue(1, forKey: .pageNumber)
        cacheManager.setValue(true, forKey: .hasNext)
        factory = DependencyContainer(coreDataManager: coreDataManager,
                                                  cacheManager: cacheManager,
                                                  apiReuest: apiManager)
        viewModel = AudioBookViewModel(factory: factory)
    }
    
    override func tearDown() {
        coreDataManager = nil
        apiManager = nil
        cacheManager = nil
        factory = nil
        viewModel = nil
    }
    
    func test_loadBestPodcasts() {
        // Arrange
        apiManager.jsonData = MockData.jsonData
        
        // Act
        viewModel.loadBestPodcasts()
        
        // Assert
        let records = coreDataManager.podcastRecords[1] ?? []
        let nextPageNumber = cacheManager.getInt(forKey: .pageNumber)
        let hasNext = cacheManager.getBool(forKey: .hasNext)
        XCTAssertEqual(nextPageNumber, 2)
        XCTAssertEqual(records.count, 3)
        XCTAssertTrue(hasNext)
    }
}
