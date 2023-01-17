//
//  Container.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import Foundation

enum Container {
    
    /// Setup container function, should be called at application start.
    static func setup() {
        let navigationService = NavigationService()
        ServiceLocator.shared.add(service: navigationService)
        
        let databaseManager = DatabaseManager.shared
        ServiceLocator.shared.add(service: databaseManager)
    }
    
    /// Service that is responsible for application navigation.
    static var navigationService: NavigationServiceProtocol {
        guard let navigationService: NavigationService = ServiceLocator.shared.getService() else {
            fatalError("NavigationService should be implement using ServiceLocator")
        }
        
        return navigationService
    }
    
    /// Manager that is responsible for storing and fetching database data.
    static var databaseManager: DatabaseManagerProtocol {
        guard let databaseManager: DatabaseManager = ServiceLocator.shared.getService() else {
            fatalError("DatabaseManager should be implement using ServiceLocator")
        }
        
        return databaseManager
    }
    
}
