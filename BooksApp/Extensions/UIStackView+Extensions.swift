//
//  UIStackView+Extensions.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import UIKit

extension UIStackView {
    
    static func vertical(
        spacing: CGFloat = 0,
        alignment: Alignment = .fill,
        distribution: Distribution = .fill,
        arrangedSubviews: [UIView] = []
    ) -> UIStackView {
        let result = UIStackView(arrangedSubviews: arrangedSubviews)
        result.axis = .vertical
        result.spacing = spacing
        result.alignment = alignment
        result.distribution = distribution
        
        return result
    }
    
    static func horizontal(
        spacing: CGFloat = 0,
        alignment: Alignment = .fill,
        distribution: Distribution = .fill,
        arrangedSubviews: [UIView] = []
    ) -> UIStackView {
        let result = UIStackView(arrangedSubviews: arrangedSubviews)
        result.axis = .horizontal
        result.spacing = spacing
        result.alignment = alignment
        result.distribution = distribution
        
        return result
    }
    
    var insets: UIEdgeInsets {
        get { layoutMargins }
        set {
            layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
            isLayoutMarginsRelativeArrangement = true
        }
    }
    
}
