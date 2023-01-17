//
//  BookCollectionCell.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import UIKit

class BookCollectionCell: BACollectionItemCell<BookCollectionCell.Model> {
    
    class Model: BACollectionItem {
        let title: String?
        let url: URL?
        
        override var reuseID: String? {
            BookCollectionCell.reuseID
        }
        
        init(title: String?, url: URL?) {
            self.title = title
            self.url = url
        }
    }
    
    private lazy var imageView: UIImageView = {
        let result = UIImageView()
        result.tintColor = AppTheme.systemBlack
        result.contentMode = .scaleAspectFit
        
        return result
    }()
    
    private lazy var titleLabel: UILabel = {
        let result = UILabel()
        result.textColor = AppTheme.systemBlack
        result.textAlignment = .center
        result.numberOfLines = 0
        
        return result
    }()
    
    override var isHighlighted: Bool {
        didSet { animate() }
    }
    
    override func setupComponents() {
        super.setupComponents()
        
        let stackView = UIStackView.vertical(
            spacing: 10,
            arrangedSubviews: [imageView, titleLabel]
        )
        
        stackView.addToSuperview(contentView) {
            $0.edges.equalToSuperview()
        }
        
        imageView.snp.makeConstraints {
            $0.height.equalToSuperview().multipliedBy(0.7)
        }
        
    }
    
    override func updateComponents() {
        super.updateComponents()
     
        imageView.setImage(url: viewModel?.url)
        titleLabel.text = viewModel?.title
    }
    
    private func animate() {
        UIView.animate(
            withDuration: 0.1,
            delay: isHighlighted ? 0.1 : 0,
            options: [.curveEaseOut],
            animations: {
                self.alpha = self.isHighlighted ? 0.9 : 1.0
                self.transform = self.isHighlighted ?
                CGAffineTransform.identity.scaledBy(x: 0.9, y: 0.9) :
                CGAffineTransform.identity
            }
        )
    }
    
}
