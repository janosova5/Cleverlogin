//
//  ViewController.swift
//  Cleverlogin
//
//  Created by Lenka Janosova on 24/06/2020.
//  Copyright © 2020 Lenka Janosova. All rights reserved.
//

import Foundation
import UIKit

protocol Instantiable {
    static func makeInstance() -> Self
}

extension Instantiable where Self: UIViewController {
    /// Instantiates controller from storyboard.
    /// - example:
    /// `let myViewController = MyViewController.makeInstance()`
    /// - important:
    /// Initial controller of the same type must exists in storyboard named as controller's
    /// class without "ViewController" suffix, otherwise will `fatalError()`.
    /// - Returns: Instantiated view controller.
    static func makeInstance() -> Self {
        let viewControllerName = String(describing: self).replacingOccurrences(of: "ViewController", with: "")
        let storyboard = UIStoryboard(name: viewControllerName, bundle: nil)
        guard let instance = storyboard.instantiateInitialViewController() as? Self else { fatalError("Could not make instance of \(String(describing: self))") }
        return instance
    }
}

extension UIViewController: Instantiable {}

extension UIViewController {
    
    func presentAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.view.tintColor = UIColor.systemIndigo
        alertController.addAction(UIAlertAction(title: C.Alert.titleOK, style: .default))
        present(alertController, animated: true)
    }
    
    func presentFailureAlert(with message: String) {
        presentAlert(title: C.Error.error, message: message)
    }
    
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self,
                         action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
    
}
