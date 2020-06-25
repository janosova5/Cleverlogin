//
//  LoadingButton.swift
//  Cleverlogin
//
//  Created by Lenka Janosova on 24/06/2020.
//  Copyright © 2020 Lenka Janosova. All rights reserved.
//

import Foundation
import UIKit

class LoadingButton: UIButton {
    
    // MARK: - Variables

    private var title: String? {
        willSet {
            if newValue != nil {
                setTitle("", for: .normal)
            } else {
                setTitle(title, for: .normal)
            }
        }
    }
    
    private var normalStateImage: UIImage? {
        willSet {
            if newValue != nil {
                setImage(nil, for: .normal)
            } else {
                setImage(normalStateImage, for: .normal)
            }
        }
    }
    
    private var selectedStateImage: UIImage? {
        willSet {
            if newValue != nil {
                setImage(nil, for: .selected)
            } else {
                setImage(selectedStateImage, for: .selected)
            }
        }
    }
    
    var activityIndicatorViewStyle: UIActivityIndicatorView.Style = .medium
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: self.activityIndicatorViewStyle)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.hidesWhenStopped = true
        spinner.color = tintColor
        return spinner
    }()
    
    var isLoading: Bool = false {
        didSet {
            if isLoading {
                if !oldValue {
                    startLoading()
                }
            } else {
                if oldValue {
                    endLoading()
                }
            }
            isUserInteractionEnabled = !isLoading
        }
    }
 
    // MARK: - Override
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureActivityIndicatorView()
    }
    
    // MARK: - Configure
    
    private func configureActivityIndicatorView() {
        addSubview(activityIndicator)
        centerXAnchor.constraint(equalTo: activityIndicator.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: activityIndicator.centerYAnchor).isActive = true
    }
    
    // MARK: - Private
    
    private func startLoading() {
        activityIndicator.startAnimating()
        title              = titleLabel?.text
        normalStateImage   = image(for: .normal)
        selectedStateImage = image(for: .selected)
    }
    
    private func endLoading() {
        activityIndicator.stopAnimating()
        title              = nil
        normalStateImage   = nil
        selectedStateImage = nil
    }
    
}

