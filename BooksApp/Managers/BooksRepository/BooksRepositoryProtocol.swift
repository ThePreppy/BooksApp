//
//  BooksRepositoryProtocol.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import Foundation

protocol BooksRepositoryProtocol {
    
    func fetchBooksList(
        query: String,
        completion: @escaping (Result<[BookModel]?, Error>) -> Void
    )
    
}
