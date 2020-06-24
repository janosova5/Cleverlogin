//
//  LoginViewDelegate.swift
//  Cleverlogin
//
//  Created by Lenka Janosova on 24/06/2020.
//  Copyright © 2020 Lenka Janosova. All rights reserved.
//

import Foundation

// direction from controller to view model

protocol LoginVM: class {
    
    func setupViewDelegate(viewDelegate: LoginViewDelegate)
    func loadImage(with credentials: LoginCredentials)
    
}

// direction from view model to controller

protocol LoginViewDelegate: class {
    
    func loginViewModelWillStartLoading(_ model: LoginViewModel)
    func loginViewModel(_ model: LoginViewModel, didEndLoadingWith error: CleverError)
    func loginViewModel(_ model: LoginViewModel, didEndLoadingWith data: ImageString)
    
}
