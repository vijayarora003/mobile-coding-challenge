//
//  DetailsViewModel.swift
//  Assignment
//
//  Created by Vijay Arora on 26/04/23.
//  Copyright © 2023 Assignment. All rights reserved.
//

import UIKit

protocol DetailsViewModelOutputDelegate {
    func loadUI(model: CDPodcast)
}

protocol DetailsViewModelInputType {
    init(factory: DependencyContainer,
         model: CDPodcast?,
         delegate: DetailsViewModelOutputDelegate)
    func loadData()
    func favourite(isFavourite: Bool)
}

final class DetailsViewModel: NSObject {

    private let factory: DependencyContainer
    private let model: CDPodcast?
    private let delegate: DetailsViewModelOutputDelegate?
    
    init(factory: DependencyContainer,
         model: CDPodcast?,
         delegate: DetailsViewModelOutputDelegate) {
        self.factory = factory
        self.model = model
        self.delegate = delegate
       
    }
    
    func loadData() {
        if let model = model {
            self.delegate?.loadUI(model: model)
        }
    }
    
    func favourite(isFavourite: Bool) {
        factory.coreDataManager.favourite(model: model, isFavourite: isFavourite)
    }
}
