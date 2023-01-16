//
//  BooksListViewModel.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import Foundation
import Kingfisher

protocol BooksListViewModelInput: AnyObject, Loadable, ErrorRepresentable {
    
    var reloadData: Closure? { get set }
    
    func fetchBooks()
    func setupAdapter(collectionView: BACollectionView)
    
}

class BooksListViewModel: BooksListViewModelInput {
    
    private var books: [BookModel] = []
    
    private let router: BooksListRouterInput
    private let repository: BooksRepositoryProtocol
    private let adapter = BACollectionViewAdapter()
    
    var reloadData: Closure?
    
    weak var loader: LoaderRepresentable?
    
    init(
        repository: BooksRepositoryProtocol,
        router: BooksListRouterInput
    ) {
        self.repository = repository
        self.router = router
    }
    
    func fetchBooks() {

    }
    
    func handle(error: Error?) {
        router.handle(error: error)
    }
    
    func setupAdapter(collectionView: BACollectionView) {
        collectionView.adapter = adapter
    }
    
    private func handle(books: [BookModel]?) {
        self.books = books ?? []
        
        reloadData?()
    }
    
}
