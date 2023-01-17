//
//  DataBaseManagerProtocol.swift
//  BooksApp
//
//  Created by Alexander on 05.01.2023.
//

import Foundation

protocol DatabaseManagerProtocol: AnyObject {
    func save()
    func fetchBooks(query: String) -> [BookModel]
}
