//
//  BooksListViewController.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import UIKit
import Kingfisher

class BooksListViewController: BAViewController {
    
    //MARK: - Properties
    
    private lazy var collectionView: BACollectionView = {
        let result = BACollectionView()
        result.setCollectionViewLayout(createLayout(), animated: false)
        result.backgroundColor = .clear
        result.registerCell(BookCollectionCell.self)
        
        viewModel.setupAdapter(collectionView: result)
        
        return result
    }()
    
    let viewModel: BooksListViewModelInput
    
    //MARK: - Lifecycle
    
    init(viewModel: BooksListViewModelInput) {
        self.viewModel = viewModel
        super.init()
    }
    
    //MARK: - Public Functions
    
    override func setupComponents() {
        super.setupComponents()
        
        setupUI()
        setupListeners()
    }
    
    //MARK: - Private Functions
    
    private func setupUI() {
        setupNavigationBar()
        
        collectionView.addToSuperview(view) {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setupNavigationBar() {
        SearchBooksNavigationDecorator.decorate(navigationItem, delegate: self)
        definesPresentationContext = true
    }
    
    private func setupListeners() {
        viewModel.reloadData = { [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        let width = 1 / CGFloat(Constants.numberOfItemsInRow)
        let heightMultiplier: CGFloat = 1.5
        
        let widthDimension = NSCollectionLayoutDimension.fractionalWidth(width)
        let heightDimension = NSCollectionLayoutDimension.fractionalWidth(width * heightMultiplier)
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: widthDimension,
            heightDimension: heightDimension
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(10)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            repeatingSubitem: item,
            count: Constants.numberOfItemsInRow
        )
        
        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    
}

//MARK: - Extensions

//MARK: UISearchBarDelegate
extension BooksListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.fetchBooks(query: searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.fetchBooks(query: "")
    }
    
}

//MARK: Constants
extension BooksListViewController {
    
    private enum Constants {
        
        static let numberOfItemsInRow: Int = 3
        
    }
    
}
