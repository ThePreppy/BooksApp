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
    
    /// Fetch books list for the given `query`.
    ///
    /// - Parameters:
    ///     - query: String that may be contained in book's title.
    ///
    /// - Returns: Result with books array or error for the given `query`.
    func fetchBooksList(
        query: String,
        completion: @escaping (Result<[BookModel]?, Error>) -> Void
    ) {
        //Database request for stored books
        let storedBooks = Container.databaseManager.fetchBooks(query: query)
        
        //If there is no books in database the API request would be called
        //Either books will be received from database
        guard storedBooks.isEmpty else {
            completion(.success(storedBooks))
            return
        }
        
        let endpoint = SearchBooksEndpoint(search: query)
        
        networkService.loadModel(endpoint: endpoint) { result in
            
            switch result {
            case .success(let model):
                //Saving books to the database
                model?.results.mapToEntities()
                Container.databaseManager.save()
                
                completion(.success(model?.results))
                
            case .failure(let error):
                completion(.failure(error))
                
            }
            
        }
    }
    
}
