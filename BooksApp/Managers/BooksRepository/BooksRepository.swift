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
        let endpoint = SearchBooksEndpoint(search: query)
        
        networkService.loadModel(endpoint: endpoint) { result in
            
            switch result {
            case .success(let model):
                completion(.success(model?.results))
                
            case .failure(let error):
                completion(.failure(error))
                
            }
            
        }
    }
    
}
