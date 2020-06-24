//
//  Either.swift
//  Cleverlogin
//
//  Created by Lenka Janosova on 23/06/2020.
//  Copyright © 2020 Lenka Janosova. All rights reserved.
//

import Foundation

enum Either<L, R> {
    
    case left(L)
    case right(R)

}
