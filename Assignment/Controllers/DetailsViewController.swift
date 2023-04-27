//
//  DetailsViewController.swift
//  Assignment
//
//  Created by Vijay Arora on 26/04/23.
//  Copyright © 2023 Vijay Arora. All rights reserved.
//

import UIKit

final class DetailsViewController: BaseViewController {
    static var storyBoardId: String = ViewIdentifiers.detailsViewController
    static var storyBoardName: String = StoryBoard.main
    
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var favouriteButton: UIButton!
    @IBOutlet private weak var podCastImageView: UIImageView!
    @IBOutlet private weak var publisherLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    
    var model: CDPodcast?
    var viewModel: DetailsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUPUI()
    }
    
    private func setUPUI() {
        viewModel = DetailsViewModel(factory: DependencyContainer.shared,
                                     model: model,
                                     delegate: self)
        viewModel.loadData()
        setBackButton()
        scrollView.contentInsetAdjustmentBehavior = .never
    }
    
    @IBAction func favouriteButtonAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        viewModel.favourite(isFavourite: sender.isSelected)
    }
}

extension DetailsViewController: DetailsViewModelOutputDelegate {
    func loadUI(model: CDPodcast) {
        titleLabel.text = model.title
        publisherLabel.text = model.publisher
        let attributedText = model.podDescription?.attributedHtmlString?.setColor(color: .grayColor).setFont(font: UIFont.regular(size: 13))
        descriptionLabel.attributedText = attributedText
        favouriteButton.isSelected = model.isFavourite
        podCastImageView.downloadImage(model.thumbnail)
    }
}
