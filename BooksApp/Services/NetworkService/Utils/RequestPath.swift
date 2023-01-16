//
//  RequestPath.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import Foundation

enum RequestPath {
    case imageList
    
    var rawValue: String {
        switch self {
        case .imageList:
            return "/list"
        }
    }
    
}
