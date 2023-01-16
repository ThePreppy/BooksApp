//
//  ErrorRepresentable.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import Foundation

protocol ErrorRepresentable: AnyObject {
    
    func handle(error: Error?)
    
}
