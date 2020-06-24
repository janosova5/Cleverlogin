//
//  LoginViewController.swift
//  Cleverlogin
//
//  Created by Lenka Janosova on 23/06/2020.
//  Copyright © 2020 Lenka Janosova. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        Service().requestLogin(credentials: LoginCredentials(username: "janosova", password: "lenka"), completion: { response in
            
            switch response {
            case .loading:
                print("loading")
            case .success(let data):
                print(data.stringValue)
                let image = data.stringValue.imageFromBase()
                self.imageView.image = image

            case .failure(let error):
                print(error)
            }
            
        })
    
        
        //Service().requestLogin1(username: Username(username: "janosova"))
        
        //btn.login => state.headers['authorzian'] = hashed(password)
    }

}
