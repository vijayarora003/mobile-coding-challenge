//
//  UIColor+Extension.swift
//  Assignment
//
//  Created by Vijay Arora on 26/04/23.
//  Copyright © 2023 Vijay Arora. All rights reserved.
//

import UIKit

extension UIColor {
    static var textColor: UIColor {
        return UIColor(named: "textColor") ?? .clear
    }
    
    static var grayColor: UIColor {
        return UIColor(named: "grayColor") ?? .clear
    }
}
