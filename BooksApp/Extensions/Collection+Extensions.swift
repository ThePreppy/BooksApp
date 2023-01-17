//
//  Collection+Extensions.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import Foundation

extension Collection {
    
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
    
}
