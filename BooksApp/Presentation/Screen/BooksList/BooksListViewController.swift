//
//  BooksListViewController.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import UIKit
import Kingfisher

class BooksListViewController: BAViewController {
    
    private lazy var collectionView: BACollectionView = {
        let result = BACollectionView()
        result.setCollectionViewLayout(createLayout(), animated: false)
        result.backgroundColor = .clear
        result.registerCell(BookCollectionCell.self)
        
        viewModel.setupAdapter(collectionView: result)
        
        return result
    }()
    
    let viewModel: BooksListViewModelInput
    
    init(viewModel: BooksListViewModelInput) {
        self.viewModel = viewModel
        super.init()
    }
    
    override func setupComponents() {
        super.setupComponents()
        
        setupUI()
        setupListeners()
        
        viewModel.fetchBooks()
    }
    
    private func setupUI() {
        navigationItem.title = R.string.localizable.books_listNavigationTitle()
        
        collectionView.addToSuperview(view) {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setupListeners() {
        viewModel.reloadData = { [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        let itemDimension = NSCollectionLayoutDimension.fractionalWidth(1 / CGFloat(Constants.numberOfItemsInRow))
        let itemSize = NSCollectionLayoutSize(
            widthDimension: itemDimension,
            heightDimension: itemDimension
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

extension BooksListViewController {
    
    private enum Constants {
        
        static let numberOfItemsInRow: Int = 3
        
    }
    
}
