//
//  Loadable.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import Foundation

protocol Loadable {
    
    var loader: LoaderRepresentable? { get set }
    
}

protocol LoaderRepresentable: AnyObject {
    
    func startLoading()
    func stopLoading()
    
}
