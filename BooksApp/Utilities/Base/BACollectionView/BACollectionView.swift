//
//  BACollectionView.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import UIKit

class BACollectionView: UICollectionView {
    
    weak var adapter: BACollectionViewAdapter? {
        didSet {
            dataSource = adapter
            delegate = adapter
        }
    }
    
    init(scrollDirection: ScrollDirection = .vertical) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = scrollDirection
        layout.itemSize = UICollectionViewFlowLayout.automaticSize
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        super.init(frame: .zero, collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
