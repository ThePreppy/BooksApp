//
//  BooksListBuilder.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import UIKit

enum BooksListBuilder {
    
    /// BooksList builder function.
    ///
    /// - Returns: BooksListViewController.
    static func build() -> BooksListViewController {
        let networkService = NetworkService()
        let repository = BooksRepository(networkService: networkService)
        let router = BooksListRouter()
        
        let viewModel = BooksListViewModel(
            repository: repository,
            router: router
        )
        let viewController = BooksListViewController(viewModel: viewModel)
        
        viewModel.loader = viewController
        router.viewController = viewController
        
        return viewController
    }
    
}
