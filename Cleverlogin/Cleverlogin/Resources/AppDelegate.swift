//
//  AppDelegate.swift
//  Cleverlogin
//
//  Created by Lenka Janosova on 23/06/2020.
//  Copyright © 2020 Lenka Janosova. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    //MARK: Window
    
    var window: UIWindow?
    
    //MARK: Public

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let service = Service()
        setLoginControllerRoot(service)
        
        return true
    }
    
    //MARK: Private
    
    private func setLoginControllerRoot(_ service: Service) {
        let loginViewModel = LoginViewModel(service: service)
        let controller = LoginViewController.create(viewModel: loginViewModel)
        
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
    }

}

