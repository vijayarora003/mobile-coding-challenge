//
//  APIConstants.swift
//  Assignment
//
//  Created by Vijay Arora on 27/04/23.
//  Copyright © 2023 Vijay Arora. All rights reserved.
//

import UIKit

struct APIConstants {
    static let BASEURL = "https://listen-api-test.listennotes.com"
    static let VERSION = BASEURL + "/api/v2/"
    static let IMAGE_BASE_URL = "http://openweathermap.org/img/wn/"
}

enum API {
    case bestPodCasts(page: Int)
    
    func getURL() -> String {
        switch self {
        case .bestPodCasts(let page):
            return APIConstants.VERSION + "best_podcasts?page=\(page)"
        }
    }
}
