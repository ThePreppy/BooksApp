//
//  BookCollectionCell.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import UIKit

class BookCollectionCell: BACollectionItemCell<BookCollectionCell.Model> {
    
    class Model: BACollectionItem {
        let url: URL?
        var isFavourite: Bool
        var didFavourite: Closure?
        
        override var reuseID: String? {
            BookCollectionCell.reuseID
        }
        
        init(url: URL?, isFavourite: Bool, didFavorite: Closure?) {
            self.url = url
            self.isFavourite = isFavourite
            self.didFavourite = didFavorite
        }
    }
    
    private lazy var imageView: UIImageView = {
        let result = UIImageView()
        result.tintColor = AppTheme.black
        
        return result
    }()
    
    override var isHighlighted: Bool {
        didSet { animate() }
    }
    
    override func setupComponents() {
        super.setupComponents()
        
        imageView.addToSuperview(contentView) {
            $0.edges.equalToSuperview()
        }
        
    }
    
    override func updateComponents() {
        super.updateComponents()
     
        imageView.setImage(url: viewModel?.url)
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
