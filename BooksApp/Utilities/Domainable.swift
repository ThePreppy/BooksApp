//
//  Domainable.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import Foundation

protocol Domainable {
    associatedtype Model
    
    func mapToModel() -> Model
}

protocol ResponseDomainable: Decodable, Domainable {
    
}

extension Collection where Element: Domainable {
    
    func mapToModels() -> [Element.Model] {
        map { $0.mapToModel() }
    }
    
}
