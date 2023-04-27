//
//  UIFont+Extension.swift
//  Assignment
//
//  Created by Vijay Arora on 26/04/23.
//  Copyright © 2023 Vijay Arora. All rights reserved.
//

import UIKit

extension UIFont {
    
    static func bold(size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-Bold", size: size) ?? .boldSystemFont(ofSize: size)
    }
    
    static func regular(size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue", size: size) ?? .boldSystemFont(ofSize: size)
    }
}
