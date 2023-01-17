//
//  NetworkServiceProtocol.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import Foundation

protocol NetworkServiceProtocol {
    
    init(jsonDecoder: JSONDecoder, successStatusCodes: [StatusCode])
    
    @discardableResult
    func loadModel<T: Endpoint>(
        endpoint: T,
        completion: @escaping (Result<T.Response.Model?, Error>) -> Void
    ) -> URLSessionTask?
    
    @discardableResult
    func loadModels<T: Endpoint>(
        endpoint: T,
        completion: @escaping (Result<[T.Response.Model]?, Error>) -> Void
    ) -> URLSessionTask?
    
}
