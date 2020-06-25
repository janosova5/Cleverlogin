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
    
    case notconnected
    case timedOut
    case unauthorized
    case unknown
    
    func message() -> String {
        switch self {
        case .notconnected:
            return C.Error.connection
        case .timedOut:
            return C.Error.timedOut
        case .unauthorized:
            return C.Error.authorization
        case .unknown:
            return C.Error.unknown
        }
    }
    
}
