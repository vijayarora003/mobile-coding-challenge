//
//  NSMutableAttributedString+Extension.swift
//  Assignment
//
//  Created by Vijay Arora on 26/04/23.
//  Copyright © 2023 Vijay Arora. All rights reserved.
//

import Foundation
import UIKit

extension NSMutableAttributedString {

    func setFont(font: UIFont) -> NSMutableAttributedString {
       self.addAttribute(.font, value: font, range: NSRange(location: 0, length: string.count))
       return self
    }
    
    func setColor(color: UIColor) -> NSMutableAttributedString  {
        self.addAttribute(.foregroundColor, value: color, range: NSRange(location: 0, length: string.count))
        return self
    }
}
