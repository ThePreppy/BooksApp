//
//  BooksListViewModel.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import Foundation

protocol BooksListViewModelInput: AnyObject, Loadable, ErrorRepresentable {
    
    var reloadData: Closure? { get set }
    
    func fetchBooks(query: String)
    func setupAdapter(collectionView: BACollectionView)
    
}

class BooksListViewModel: BooksListViewModelInput {
    
    //MARK: - Properties
    
    private var books: [BookModel] = []
    
    private let router: BooksListRouterInput
    private let repository: BooksRepositoryProtocol
    private let adapter = BACollectionViewAdapter()
    
    var reloadData: Closure?
    
    weak var loader: LoaderRepresentable?
    
    //MARK: - Public Functions
    
    init(
        repository: BooksRepositoryProtocol,
        router: BooksListRouterInput
    ) {
        self.repository = repository
        self.router = router
    }
    
    /// Fetch books list for the given `query`.
    ///
    /// - Parameters:
    ///     - query: String that may be contained in book's title.
    ///
    func fetchBooks(query: String) {
        //Debouncer for api calls minimisation
        DispatchQueue.main.asyncDeduped(target: self, after: 1.5) { [weak self] in
            self?._fetchBooks(query: query)
        }
    }
    
    func handle(error: Error?) {
        router.handle(error: error)
    }
    
    func setupAdapter(collectionView: BACollectionView) {
        collectionView.adapter = adapter
    }
    
    //MARK: - Private functions
    
    private func clearData() {
        books = []
        adapter.sections = []
        
        reloadData?()
    }
    
    private func _fetchBooks(query: String) {
        guard !query.isEmpty else {
            clearData()
            return
        }
        
        loader?.startLoading()
        
        repository.fetchBooksList(query: query) { [weak self] result in
            self?.loader?.stopLoading()
            
            switch result {
            case .success(let models):
                guard let models else {
                    self?.handle(error: BAError.somethingWentWrong)
                    return
                }
                
                self?.handle(books: models)
                
            case .failure(let error):
                self?.handle(error: error)
                
            }
        }
    }
    
    private func handle(books: [BookModel]) {
        //Error will be showed if no books were found
        guard !books.isEmpty else {
            handle(error: SearchBooksError.nothingFound)
            return
        }
        
        self.books = books
        
        setupSections()
        reloadData?()
    }
    
    private func setupSections() {
        let items = books.map {
            BookCollectionCell.Model(title: $0.title, url: $0.cover)
        }
        adapter.sections = [BACollectionSection(items: items)]
    }
    
}
