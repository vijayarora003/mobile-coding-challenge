//
//  AudioBookModel.swift
//  Assignment
//
//  Created by Vijay Arora on 27/04/23.
//  Copyright © 2023 Vijay Arora. All rights reserved.
//

import Foundation

// MARK: - AudioBookModel
struct AudioBookModel: Codable {
    let total: Int?
    let hasNext: Bool?
    let podcasts: [Podcast]?
    let nextPageNumber: Int?

    enum CodingKeys: String, CodingKey {
        case hasNext = "has_next"
        case podcasts, total
        case nextPageNumber = "next_page_number"
    }
}

// MARK: - Podcast
struct Podcast: Codable {
    let id: String?
    let image: String?
    let title: String?
    let publisher: String?
    let thumbnail: String?
    let description: String?

    enum CodingKeys: String, CodingKey {
        case id, image, title
        case publisher, thumbnail, description
    }
}
