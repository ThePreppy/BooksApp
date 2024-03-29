//
//  RequestPath.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import Foundation

enum RequestPath {
    case searchBooks
    case cover(id: Int)
    
    var rawValue: String {
        switch self {
        case .searchBooks:
            return "/search.json"
        case .cover(let id):
            return "/b/id/\(id)"
        }
    }
    
}
