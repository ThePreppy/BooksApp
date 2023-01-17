//
//  SearchBooksError.swift
//  BooksApp
//
//  Created by Alexander on 17.01.2023.
//

import Foundation

enum SearchBooksError: LocalizedError {
    case nothingFound
    
    var errorDescription: String? {
        switch self {
        case .nothingFound:
            return R.string.localizable.books_listNothing_foundError()
        }
    }
}
