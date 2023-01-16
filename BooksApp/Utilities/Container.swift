//
//  Container.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import Foundation

enum Container {
    
    static func setup() {
        let navigationService = NavigationService()
        ServiceLocator.shared.add(service: navigationService)
    }
    
    static var navigationService: NavigationServiceProtocol {
        guard let navigationService: NavigationService = ServiceLocator.shared.getService() else {
            fatalError("NavigationService should be implement using ServiceLocator")
        }
        
        return navigationService
    }
    
}
