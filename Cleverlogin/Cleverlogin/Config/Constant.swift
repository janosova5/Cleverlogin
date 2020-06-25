//
//  Constant.swift
//  Cleverlogin
//
//  Created by Lenka Janosova on 25/06/2020.
//  Copyright © 2020 Lenka Janosova. All rights reserved.
//

import Foundation

enum C {
    
    enum Alert {
        static let titleOK = "OK"
    }

    enum Api {
        static let baseURL = "https://mobility.cleverlance.com"
        
        enum Endpoint {
            static let login = "/download/bootcamp/image.php"
        }
        
        enum Header {
            static let contentType = "application/x-www-form-urlencoded"
        }
        
        enum Parameter {
            static let username = "username"
        }
    }
    
    enum Error {
        static let error = "Error"
        static let authorization = "User is not authorized."
        static let connection = "No internet, check your connection."
        static let timedOut = "Request timed out."
        static let unknown = "Oops, unknown error."
        static let validation = "Username and password are invalid. Please, correct your credentials."
    }
    
}
