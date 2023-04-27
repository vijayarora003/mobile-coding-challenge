//
//  DetailsViewModelTests.swift
//  AssignmentTests
//
//  Created by Vijay Arora on 27/04/23.
//  Copyright © 2023 Vijay Arora. All rights reserved.
//

import XCTest
@testable import Assignment

class DetailsViewModelTests: XCTestCase {
    private(set) var viewModel: DetailsViewModel!
    private(set) var factory: DependencyContainer!
    private(set) var podcast: CDPodcast!
    private(set) var expectation: XCTestExpectation?
    
    override func setUp() {
        let coreDataManager = MockCoreDataManager()
        factory = DependencyContainer(coreDataManager: coreDataManager)
        viewModel = DetailsViewModel(factory: factory,
                                     model: MockData.podcast,
                                     delegate: self)
    }
    
    override func tearDown() {
        factory = nil
        viewModel = nil
    }
    
    func test_loadData() {
        // Act
        let expectation = expectation(description: "test_loadData")
        self.expectation = expectation
        viewModel.loadData()

        // Assert
        wait(for: [expectation], timeout: 1.0)
        XCTAssertEqual(podcast.title, "title")
        XCTAssertEqual(podcast.publisher, "publisher")
        XCTAssertEqual(podcast.id, "1")
    }
    
    func test_favourite() {
        // Act
        let expectation = expectation(description: "test_loadData")
        self.expectation = expectation
        viewModel.favourite(isFavourite: true)
        viewModel.loadData()

        // Assert
        wait(for: [expectation], timeout: 1.0)
        XCTAssertEqual(podcast.isFavourite, true)
    }
}

extension DetailsViewModelTests: DetailsViewModelOutputDelegate {
    func loadUI(model: CDPodcast) {
        podcast = model
        expectation?.fulfill()
        expectation = nil
    }
}
