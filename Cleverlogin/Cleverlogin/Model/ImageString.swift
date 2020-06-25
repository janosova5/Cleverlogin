//
//  ImageString.swift
//  Cleverlogin
//
//  Created by Lenka Janosova on 25/06/2020.
//  Copyright © 2020 Lenka Janosova. All rights reserved.
//

import Foundation

struct ImageString: Decodable {
    
    let stringValue: String
    
    enum CodingKeys: String, CodingKey {
        case stringValue = "image"
    }
    
}
