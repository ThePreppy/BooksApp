//
//  BACollectionItem.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import Foundation

class BACollectionItem {
    
    enum Width {
        case `default`
        case custom(value: CGFloat)
    }
    
    var reuseID: String? { nil }
    var width: Width { .default }
    
}
