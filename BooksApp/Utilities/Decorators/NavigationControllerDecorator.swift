//
//  NavigationControllerDecorator.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import UIKit

enum NavigationControllerDecorator {
    
    static func decorate(_ navigationController: UINavigationController) {
        let navigationBar = navigationController.navigationBar
        let appearance = navigationBar.standardAppearance
        let titleColor: UIColor = AppTheme.white
        
        appearance.backgroundColor = AppTheme.primary
        appearance.largeTitleTextAttributes = [.foregroundColor : titleColor]
        appearance.titleTextAttributes = [.foregroundColor : titleColor]
        appearance.backButtonAppearance.normal.titleTextAttributes = [.foregroundColor : titleColor]
        
        navigationBar.prefersLargeTitles = true
        navigationBar.tintColor = titleColor
        navigationBar.standardAppearance = appearance
        navigationBar.compactAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
        navigationBar.compactScrollEdgeAppearance = appearance
    }
    
}
