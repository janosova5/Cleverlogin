//
//  LoginViewModel.swift
//  Cleverlogin
//
//  Created by Lenka Janosova on 24/06/2020.
//  Copyright © 2020 Lenka Janosova. All rights reserved.
//

import Foundation

final class LoginViewModel {
    
    //MARK: Variables
    
    private weak var viewDelegate: LoginViewDelegate?
    private var service: Service
    
    //MARK: Init
    
    init(service: Service) {
        self.service = service
    }
    
}

// MARK: - LoginVM Methods

extension LoginViewModel: LoginVM {
    
    func setupViewDelegate(viewDelegate: LoginViewDelegate) {
        self.viewDelegate = viewDelegate
    }
    
    func loadImage(with credentials: LoginCredentials) {
        service.requestLogin(credentials: credentials) { [weak self] response in
            if let `self` = self {
                switch response {
                case .loading:
                    self.viewDelegate?.loginViewModelWillStartLoading(self)
                case .success(let image):
                    self.viewDelegate?.loginViewModel(self, didEndLoadingWith: image)
                case .failure(let error):
                    self.viewDelegate?.loginViewModel(self, didEndLoadingWith: error)
                }
            }
        }
    }
    
}
