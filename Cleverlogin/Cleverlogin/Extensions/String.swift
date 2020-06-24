//
//  String.swift
//  Cleverlogin
//
//  Created by Lenka Janosova on 24/06/2020.
//  Copyright © 2020 Lenka Janosova. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func imageFromBase() -> UIImage? {
        if let imageData = Data(base64Encoded: self, options: .ignoreUnknownCharacters) {
            return UIImage(data: imageData)
        }
        return nil
    }
    
}
