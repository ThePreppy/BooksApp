//
//  SplashViewController.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import UIKit

class SplashViewController: BAViewController {
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let result = UIActivityIndicatorView()
        result.style = .large
        result.color = AppTheme.primary
        result.startAnimating()
        
        return result
    }()
    
    private lazy var titleLabel: UILabel = {
        let result = UILabel()
        result.text = Constants.Application.name
        result.textColor = AppTheme.systemBlack
        result.font = .systemFont(ofSize: 22, weight: .semibold)
        
        return result
    }()
    
    override func setupComponents() {
        super.setupComponents()
        
        view.backgroundColor = AppTheme.systemWhite
        
        let stackView = UIStackView.vertical(
            spacing: 10,
            alignment: .center,
            arrangedSubviews: [activityIndicator, titleLabel]
        )
        
        stackView.addToSuperview(view) {
            let safeArea = view.safeAreaLayoutGuide
            
            $0.center.equalTo(safeArea)
            $0.top.leading.greaterThanOrEqualTo(safeArea).inset(16)
            $0.bottom.trailing.lessThanOrEqualTo(safeArea).inset(16)
        }
        
    }
    
}
