//
//  BACollectionHeaderFooter.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import UIKit

class BACollectionHeaderFooter: UICollectionReusableView {
    
    var _viewModel: Any? {
        didSet { updateComponents() }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupComponents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupComponents()
    }
    
    func setupComponents() {
        
    }
    
    func updateComponents() {
        
    }
    
}
