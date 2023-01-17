//
//  SearchBooksNavigationDecorator.swift
//  BooksApp
//
//  Created by Alexander on 17.01.2023.
//

import UIKit

enum SearchBooksNavigationDecorator {
    
    static func decorate(_ navigationItem: UINavigationItem, delegate: UISearchBarDelegate) {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = R.string.localizable.books_listSearch_books()
        searchController.searchBar.tintColor = AppTheme.white
        searchController.searchBar.delegate = delegate
        
        navigationItem.searchController = searchController
        navigationItem.title = R.string.localizable.books_listNavigationTitle()
    }
    
}
