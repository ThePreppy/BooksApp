//
//  BAViewController+ErrorRepresentable.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import Foundation

extension BAViewController: ErrorRepresentable {
    
    func handle(error: Error?) {
        guard let error = error else {
            return
        }
        
        let alertViewController = AlertBuilder()
            .message(error.localizedDescription)
            .addAction(.ok())
            .build()
        
        present(alertViewController, animated: true)
    }
    
}
