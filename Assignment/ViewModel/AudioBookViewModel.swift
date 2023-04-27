//
//  AudioBookViewModel.swift
//  Assignment
//
//  Created by Vijay Arora on 27/04/23.
//  Copyright © 2023 Vijay Arora. All rights reserved.
//

import UIKit

protocol AudioBookViewModelInputType {
    init(factory: DependencyContainer)
    func loadBestPodcasts()
    func loadNewPage(isLoad: Bool)
}

final class AudioBookViewModel: AudioBookViewModelInputType {

    private let factory: DependencyContainer
    private var page: Int = 1
    private var apiCallMade: Bool = true
    private var hasNext: Bool = false
    
    required init(factory: DependencyContainer) {
        self.factory = factory
        self.page = factory.cacheManager.getInt(forKey: .pageNumber)
        self.hasNext = factory.cacheManager.getBool(forKey: .hasNext)
    }
    
    func loadBestPodcasts() {
        if apiCallMade && hasNext {
            apiCallMade = false
            factory.apiReuest.perform(path: API.bestPodCasts(page: page).getURL()) { [weak self] (model: AudioBookModel?, error: String?) in
                if let model = model, let podcasts = model.podcasts, !podcasts.isEmpty {
                    self?.factory.coreDataManager.saveRecord(podcasts: podcasts, page: self?.page)
                    self?.updatePageNumber(model: model)
                }
            }
        }
    }
    
    func loadNewPage(isLoad: Bool) {
        if isLoad {
            loadBestPodcasts()
        }
    }
    
    private func updatePageNumber(model: AudioBookModel) {
        if model.hasNext == true {
            page += 1
            apiCallMade = true
            hasNext = model.hasNext ?? false
            factory.cacheManager.setValue(page, forKey: .pageNumber)
            factory.cacheManager.setValue(hasNext, forKey: .hasNext)
        }
    }
}
