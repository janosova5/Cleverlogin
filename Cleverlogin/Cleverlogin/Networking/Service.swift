//
//  Service.swift
//  Cleverlogin
//
//  Created by Lenka Janosova on 23/06/2020.
//  Copyright © 2020 Lenka Janosova. All rights reserved.
//

import Foundation
import Alamofire

final class Service {
    
    //MARK: Public
    
    func requestLogin(credentials: LoginCredentials, completion: @escaping (Result<CleverError, ImageString>) -> Void) {
        request(endpoint: .login(credentials), completion: { (response: Result<CleverError, ImageString>) in
            switch response {
            case .loading:
                completion(.loading)
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
    
    //MARK: Private
    
    private func request<T: Decodable>(endpoint: Endpoint, completion: @escaping (Result<CleverError, T>) -> Void ) {
        
        if let request = try? endpoint.asURLRequest(baseURL: endpoint.baseURLDefault) {
            
            completion(.loading)
            
            AF.request(request).responseDecodable {
                (response: DataResponse<T, AFError>) in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    switch error {
                    case .sessionTaskFailed(error: let error as URLError):
                        switch error.code {
                        case .timedOut: completion(.failure(.timedOut))
                        case .notConnectedToInternet: completion(.failure(.notconnected))
                        default: completion(.failure(.unknown))
                        }
                    default:
                        if let errorCode = response.response?.statusCode, errorCode == 401 {
                            completion(.failure(.unauthorized))
                        } else {
                            completion(.failure(.unknown))
                        }
                    }
                }
            }
        }
    }
    
}
