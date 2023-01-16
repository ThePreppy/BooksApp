//
//  UIImageView+Extensions.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func setImage(url: URL?, shouldDownsample: Bool = true) {
        guard let url else {
            image = R.image.no_imagePlaceholderIc()
            return
        }
        
        kf.setImage(
            with: url,
            placeholder: R.image.no_imagePlaceholderIc()
        )
    }
    
}
