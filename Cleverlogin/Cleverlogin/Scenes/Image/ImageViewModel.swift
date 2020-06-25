//
//  ImageViewModel.swift
//  Cleverlogin
//
//  Created by Lenka Janosova on 24/06/2020.
//  Copyright © 2020 Lenka Janosova. All rights reserved.
//

import Foundation

final class ImageViewModel {
    
    //MARK: Variables
    
    private weak var viewDelegate: ImageViewDelegate?
    private var imageString: ImageString
    
    //MARK: Init
    
    init(imageString: ImageString) {
        self.imageString = imageString
    }
    
}

// MARK: - ImageVM Methods

extension ImageViewModel: ImageVM {
    
    func setupViewDelegate(viewDelegate: ImageViewDelegate) {
        self.viewDelegate = viewDelegate
    }
    
    func showImage() {
        if let image = imageString.stringValue.imageFromBase() {
            viewDelegate?.imageViewModel(self, shouldShowImage: image)
        }
    }
    
}
