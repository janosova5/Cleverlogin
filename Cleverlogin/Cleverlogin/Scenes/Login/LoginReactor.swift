//
//  LoginReactor.swift
//  Cleverlogin
//
//  Created by Lenka Janosova on 24/06/2020.
//  Copyright © 2020 Lenka Janosova. All rights reserved.
//

import Foundation
import RxSwift
import ReactorKit

final class LoginReactor: Reactor {
    
    //MARK: Variables
    
    var initialState: LoginReactor.State
    var service: Service
    
    enum Action {
        case showImage(LoginCredentials)
    }
    
    enum Mutation {
        case showImageClicked(LoginCredentials)
        case loginResultLoaded(Result<CleverError, ImageString>)
    }
    
    struct State {
        var username: String
        var password: String
        var loginResult: Result<CleverError, ImageString>? = nil
    }
    
    //MARK: Init
    
    init(service: Service) {
        self.service = service
        initialState = State(username: "", password: "")
    }
    
    //MARK: RxSwift Methods

    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .showImage(let credentials):
            login(credentials: credentials)
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        
        switch mutation {
        case .showImageClicked(let credentials):
            newState.username = credentials.username
            newState.password = credentials.password
        }
        
        return newState
    }
    
    //MARK: Private Validation Methods
    
    
    //MARK: Private Request Methods
    
    private func login(credentials: LoginCredentials) -> Observable<Result<CleverError, ImageString>> {
        
        service.requestLogin(credentials: credentials) { (response) in
            let resp = response
            return Observable.just(response)
        }
    }
    
    
}
