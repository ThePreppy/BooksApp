//
//  NavigationServiceProtocol.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import UIKit

protocol NavigationServiceProtocol {
    
    func start()
    func setup(with windowScene: UIWindowScene) -> UIWindow?
    func showMain()
    
}
