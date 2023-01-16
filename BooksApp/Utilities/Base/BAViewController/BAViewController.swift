//
//  BAViewController.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import UIKit

class BAViewController: UIViewController {
    
    private let loaderView = LoaderView()
    
    init() {
        super.init(nibName: nil, bundle: Bundle(for: Self.self))
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupComponents()
    }
    
    func setupComponents() {
        view.backgroundColor = AppTheme.systemWhite
    }
    
}

extension BAViewController: LoaderRepresentable {
    
    func startLoading() {
        loaderView.addToSuperview(view) {
            $0.edges.equalToSuperview()
        }
    }
    
    func stopLoading() {
        loaderView.removeFromSuperview()
    }
    
}
