//
//  LoaderView.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import UIKit

class LoaderView: BAView {
    
    //MARK: - Outlets
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let result = UIActivityIndicatorView(style: .large)
        result.color = AppTheme.primary
        result.startAnimating()
        
        return result
    }()
    
    //MARK: - Functions
    override func setupComponents() {
        super.setupComponents()
        
        backgroundColor = AppTheme.black.withAlphaComponent(0.7)
        
        activityIndicator.addToSuperview(self) {
            $0.center.equalToSuperview()
        }
        
    }
    
}
