//
//  LoginViewController.swift
//  Cleverlogin
//
//  Created by Lenka Janosova on 23/06/2020.
//  Copyright © 2020 Lenka Janosova. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var downloadButton: LoadingButton!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
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
        
        setup()
    }
    
    // MARK: - IBAction
    
    @IBAction func downloadClicked(_ sender: Any) {
        let username = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        viewModel?.loadImage(with: LoginCredentials(username: username, password: password))
        view.endEditing(true)
    }
    
    // MARK: - Private
    
    private func setup() {
        viewModel?.setupViewDelegate(viewDelegate: self)
        hideKeyboardWhenTappedAround()
    }
    
    private func presentImageController(imageString: ImageString) {
        let imageViewModel = ImageViewModel(imageString: imageString)
        let controller = ImageViewController.create(viewModel: imageViewModel)
        
        self.present(controller, animated: true, completion: nil)
    }

}
// MARK: - LoginViewDelegate

extension LoginViewController: LoginViewDelegate {
    
    func loginViewModelWillStartLoading(_ model: LoginViewModel) {
        downloadButton.isLoading = true
    }
    
    func loginViewModel(_ model: LoginViewModel, didEndLoadingWith error: CleverError) {
        downloadButton.isLoading = false
        presentErrorResponseAlert(with: error.message())
    }
    
    func loginViewModel(_ model: LoginViewModel, didEndLoadingWith data: ImageString) {
        presentImageController(imageString: data)
        downloadButton.isLoading = false
    }
    
}
