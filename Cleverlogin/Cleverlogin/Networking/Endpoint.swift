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
    
    //MARK: Login endpoint
    
    case login(LoginCredentials)
    
    //MARK: Variables
    
    var baseURLDefault: String {
        return C.Api.baseURL
    }
    
    private var path: String {
        switch self {
        case .login: return C.Api.Endpoint.login
        }
    }
    
    private var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        }
    }
    
    private var defaultHeader: HTTPHeader {
        return HTTPHeader(name: "Content-Type", value: C.Api.Header.contentType)
    }
    
    private var authorizationHeader: HTTPHeader? {
        switch self {
        case .login(let credentials):
            let encryptedPassword = credentials.password.sha1()
            return HTTPHeader(name: "Authorization", value: encryptedPassword)
        }
    }
    
    private var parameterEncoder: ParameterEncoder {
        switch self {
        case .login: return URLEncodedFormParameterEncoder()
        }
    }
    
    private func encodeParameters(into request: URLRequest) throws -> URLRequest {
        switch self {
        case let .login(credentials):
            let parameters = [C.Api.Parameter.username : credentials.username]
            return try parameterEncoder.encode(parameters, into: request)
        }
    }
    
    //MARK: Request
    
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
