//
//  String+Extension.swift
//  Assignment
//
//  Created by Vijay Arora on 26/04/23.
//  Copyright © 2023 Vijay Arora. All rights reserved.
//

import UIKit

extension String {
    
    var utfData: Data {
        return Data(utf8)
    }
    
    var attributedHtmlString: NSMutableAttributedString? {
        do {
            return try NSMutableAttributedString(data: utfData, options: [
              .documentType: NSAttributedString.DocumentType.html,
              .characterEncoding: String.Encoding.utf8.rawValue
            ],
            documentAttributes: nil)
        } catch {
            print("Error:", error)
            return nil
        }
    }
    
}
