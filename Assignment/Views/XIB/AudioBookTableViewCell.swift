//
//  AudioBookTableViewCell.swift
//  Assignment
//
//  Created by Vijay Arora on 27/04/23.
//  Copyright © 2023 Vijay Arora. All rights reserved.
//

import UIKit

final class AudioBookTableViewCell: UITableViewCell {

    @IBOutlet private weak var podcastTitleLabel: UILabel!
    @IBOutlet private weak var podcastImageView: UIImageView!
    @IBOutlet private weak var favouritedLabel: UILabel!
    @IBOutlet private weak var publisherLabel: UILabel!
    
    var model: CDPodcast? {
        didSet {
            guard let model = model else { return }
            podcastTitleLabel.text = model.title
            favouritedLabel.isHidden = !model.isFavourite
            publisherLabel.text = model.publisher
            podcastImageView.downloadImage(model.thumbnail)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
