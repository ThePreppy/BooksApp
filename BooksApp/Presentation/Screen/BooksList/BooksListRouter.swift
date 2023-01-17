//
//  BooksListRouter.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import UIKit

protocol BooksListRouterInput: AnyObject, ErrorRepresentable {
    
    var viewController: BAViewController? { get set }
    
}

class BooksListRouter: BooksListRouterInput {
    
    weak var viewController: BAViewController?
    
    func handle(error: Error?) {
        viewController?.handle(error: error)
    }
    
}
