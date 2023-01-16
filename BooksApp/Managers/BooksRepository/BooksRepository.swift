//
//  BooksRepository.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import Foundation

class BooksRepository: BooksRepositoryProtocol {
    
    let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetchBooksList(
        query: String,
        completion: @escaping (Result<[BookModel]?, Error>) -> Void
    ) {
        
        
        
    }
    
}
