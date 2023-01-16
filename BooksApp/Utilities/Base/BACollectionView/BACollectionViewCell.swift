//
//  BACollectionViewCell.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import UIKit

class BACollectionViewCell: UICollectionViewCell {
    // MARK: - Props
    var _viewModel: Any? {
        didSet { updateComponents() }
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupComponents()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setupComponents()
    }

    // MARK: - Methods
    override func awakeFromNib() {
        super.awakeFromNib()

        setupComponents()
    }

    // MARK: - BAViewProtocol
    func setupComponents() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
    }
    
    func updateComponents() {}
}
