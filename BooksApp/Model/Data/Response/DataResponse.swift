//
//  DataResponse.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import Foundation

struct DataResponse {
    let response: URLResponse?
    let data: Data?
    let error: Error?
    
    var result: Result<Data, Error> {
        if let error {
            return .failure(error)
        }
        
        if let data {
            return .success(data)
        }
        
        return .failure(BAError.somethingWentWrong)
    }
    
}
