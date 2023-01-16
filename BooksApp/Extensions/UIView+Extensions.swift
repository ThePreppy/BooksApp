//
//  UIView+Extensions.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import UIKit
import SnapKit

extension UIView {
    
    func addToSuperview(_ superview: UIView, makeConstraints: DataClosure<ConstraintMaker>) {
        translatesAutoresizingMaskIntoConstraints = false
        superview.addSubview(self)
        
        snp.makeConstraints(makeConstraints)
    }
    
}
