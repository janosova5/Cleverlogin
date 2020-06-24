//
//  ImageViewController.swift
//  Cleverlogin
//
//  Created by Lenka Janosova on 24/06/2020.
//  Copyright © 2020 Lenka Janosova. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    private var viewModel: ImageViewModel?

    // MARK: - Initialization
    
    static func create(viewModel: ImageViewModel) -> ImageViewController {
        let controller = self.makeInstance()
        controller.viewModel = viewModel
        return controller
    }
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.setupViewDelegate(viewDelegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel?.showImage()
    }

}

extension ImageViewController: ImageViewDelegate {
    
    func imageViewModel(_ model: ImageViewModel, shouldShowImage image: UIImage) {
        imageView.image = image
    }
    
}
