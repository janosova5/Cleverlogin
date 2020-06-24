//
//  Result.swift
//  Cleverlogin
//
//  Created by Lenka Janosova on 23/06/2020.
//  Copyright © 2020 Lenka Janosova. All rights reserved.
//

import Foundation

enum Result<E, V> {
    
    case loading
    case success(V)
    case failure(E)
    
}

enum CleverError: Error {
    
    case unauthorized
    case notconnected
    case unknown
    case timedOut
    
}
