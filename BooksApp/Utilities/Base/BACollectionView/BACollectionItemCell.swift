//
//  BACollectionItemCell.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import Foundation

class BACollectionItemCell<Model: BACollectionItem>: BACollectionViewCell {
    
    var viewModel: Model? {
        get { _viewModel as? Model }
        set { _viewModel = newValue }
    }
    
}
