//
//  ServiceLocator.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import Foundation

protocol ServiceLocating {
    func add<T>(service: T)
    func getService<T>() -> T?
}

class ServiceLocator: ServiceLocating {
    
    static let shared = ServiceLocator()
    private lazy var services: [String: Any] = [:]
    
    func add<T>(service: T) {
        let key = typeName(some: T.self)
        services[key] = service
    }
    
    func getService<T>() -> T? {
        let key = typeName(some: T.self)
        return services[key] as? T
    }
    
    private func typeName(some: Any) -> String {
        return (some is Any.Type) ? "\(some)" : "\(type(of: some))"
    }
}
