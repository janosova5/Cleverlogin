//
//  LoginCredentials.swift
//  Cleverlogin
//
//  Created by Lenka Janosova on 23/06/2020.
//  Copyright © 2020 Lenka Janosova. All rights reserved.
//

import Foundation

struct LoginCredentials: Encodable {
    
    let username: String
    let password: String
    
    enum CodingKeys: String, CodingKey {
        case password = "authorization"
    }
}

struct ImageString: Decodable {
    
    let stringValue: String
    
    enum CodingKeys: String, CodingKey {
        case stringValue = "image"
    }
}
