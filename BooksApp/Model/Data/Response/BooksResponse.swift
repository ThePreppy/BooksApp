//
//  BooksResponse.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import Foundation

struct BooksResponse: ResponseDomainable {
    typealias Model = BooksModel
    
    let numFound: Int?
    let start: Int?
    let numFoundExact: Bool?
    let docs: [BookResponse]?
    let q: String?
    
    enum CodingKeys: String, CodingKey {
        case numFound
        case start
        case numFoundExact
        case docs
        case q
    }
    
    func mapToModel() -> BooksModel {
        BooksModel(results: docs?.mapToModels() ?? [])
    }
    
}
