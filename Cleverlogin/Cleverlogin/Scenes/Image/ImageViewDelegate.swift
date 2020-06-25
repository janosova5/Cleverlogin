//
//  ImageViewDelegate.swift
//  Cleverlogin
//
//  Created by Lenka Janosova on 24/06/2020.
//  Copyright © 2020 Lenka Janosova. All rights reserved.
//

import Foundation
import UIKit

// direction from controller to view model

protocol ImageVM: class {
    
    func setupViewDelegate(viewDelegate: ImageViewDelegate)
    func showImage()
    
}

// direction from view model to controller

protocol ImageViewDelegate: class {
    
    func imageViewModel(_ model: ImageViewModel, shouldShowImage image: UIImage)
    
}
