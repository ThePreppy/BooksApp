//
//  SearchBooksEndpoint.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import Foundation

struct SearchBooksEndpoint: Endpoint {
    typealias Response = BooksResponse
    
    struct Parameters: RequestParameters {
        let q: String
        var page: Int = Constants.Books.page
        var limit: Int = Constants.Books.limit
        var fields = Constants.Books.fields
    }
    
    let search: String
    
    var path: RequestPath {
        .searchBooks
    }
    
    var query: RequestParameters? {
        Parameters(q: search)
    }
    
}
