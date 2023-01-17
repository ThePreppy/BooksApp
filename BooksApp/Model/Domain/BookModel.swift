//
//  BookModel.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import Foundation

struct BookModel {
    let id: String
    let title: String?
    let cover: URL?
}

extension BookModel: Coredatable {
    typealias ModelType = BookEntity
    
    @discardableResult
    func mapToEntity() -> BookEntity {
        BookEntity(id: id, title: title, cover: cover)
    }
    
}
