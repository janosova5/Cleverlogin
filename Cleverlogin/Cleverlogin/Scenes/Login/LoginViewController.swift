//
//  LoginViewController.swift
//  Cleverlogin
//
//  Created by Lenka Janosova on 23/06/2020.
//  Copyright © 2020 Lenka Janosova. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - Variables
    
    private var viewModel: LoginViewModel?

    // MARK: - Initialization
    
    static func create(viewModel: LoginViewModel) -> LoginViewController {
        let controller = self.makeInstance()
        controller.viewModel = viewModel
        return controller
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.setupViewDelegate(viewDelegate: self)
        viewModel?.loadImage(with: LoginCredentials(username: "janosova", password: "lenka"))
    }

}

// MARK: - LoginViewDelegate

extension LoginViewController: LoginViewDelegate {
    
    func loginViewModelWillStartLoading(_ model: LoginViewModel) {
        // button start loading
    }
    
    func loginViewModel(_ model: LoginViewModel, didEndLoadingWith error: CleverError) {
        // present alert
    }
    
    func loginViewModel(_ model: LoginViewModel, didEndLoadingWith data: ImageString) {
        let imageViewModel = ImageViewModel(imageString: data)
        let controller = ImageViewController.create(viewModel: imageViewModel)
        self.present(controller, animated: true, completion: nil)
    }
    
}
