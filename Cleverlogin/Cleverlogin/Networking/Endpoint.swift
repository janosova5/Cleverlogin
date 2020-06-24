//
//  Endpoint.swift
//  Cleverlogin
//
//  Created by Lenka Janosova on 23/06/2020.
//  Copyright © 2020 Lenka Janosova. All rights reserved.
//

import Foundation
import Alamofire
import CryptoSwift

enum Endpoint {
    
    case login(LoginCredentials)
    
    var baseURLDefault: String {
        return "https://mobility.cleverlance.com"
    }
    
    private var path: String {
        switch self {
        case .login: return "/download/bootcamp/image.php"
        }
    }
    
    private var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        }
    }
    
    private var defaultHeader: HTTPHeader {
         return HTTPHeader(name: "Content-Type", value: "application/x-www-form-urlencoded")
    }
    
    private var authorizationHeader: HTTPHeader? {
        switch self {
        case .login(let credentials):
            let encryptedPassword = credentials.password.sha1()
            return HTTPHeader(name: "Authorization", value: encryptedPassword)
        default: return nil
        }
        
    }
    
    
    //var parameters: Either<Parameters, Encodable>?  {
        //switch self {
        //case .login(let credentials):
            //let parameters = ["username" : credentials.username]
            
            //return .left(parameters)
        //case .login1(let username):
            //return .right(username)
        //}
    //}
    
    private var parameterEncoder: ParameterEncoder {
        switch self {
        case .login: return URLEncodedFormParameterEncoder()
        }
    }
    
    private func encodeParameters(into request: URLRequest) throws -> URLRequest {
        switch self {
        case let .login(credentials):
            let parameters = ["username" : credentials.username]
            return try parameterEncoder.encode(parameters, into: request)
        }
    }
    
    func asURLRequest(baseURL: String) throws -> URLRequest {
        var url = try baseURL.asURL()
        url.appendPathComponent(path)
        
        var request = URLRequest(url: url)
        request.method = method
        
        request.headers.add(defaultHeader)
        if let authHeader = authorizationHeader {
            request.headers.add(authHeader)
        }
        
        return try encodeParameters(into: request)
    }
    
}
