//
//  UIImageView+Extensions.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    /// Load, cache and display image for given `url`.
    ///
    /// - Parameters:
    ///     - url: if the URL is nil - placeholder will be placed.
    ///
    func setImage(url: URL?) {
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
