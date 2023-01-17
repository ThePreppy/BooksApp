//
//  UICollectionReusableView+Extensions.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import UIKit

extension UICollectionReusableView {
    
    static var reuseID: String {
        String(describing: Self.self)
    }
    
}
