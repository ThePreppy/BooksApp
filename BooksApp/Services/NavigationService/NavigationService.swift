//
//  NavigationService.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import UIKit

class NavigationService: NavigationServiceProtocol {
    
    private var window: UIWindow?
    
    func start() {
        showSplashScreen()
        showMain()
    }
    
    func setup(with windowScene: UIWindowScene) -> UIWindow? {
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        
        return window
    }
    
    func showMain() {
        let booksNavigationController = BANavigationController(rootViewController: UIViewController())
        NavigationControllerDecorator.decorate(booksNavigationController)
        
        setRoot(viewController: booksNavigationController)
    }
    
    private func showSplashScreen() {
        let viewController = SplashViewController()
        setRoot(viewController: viewController)
    }
    
    private func setRoot(viewController: UIViewController) {
        window?.rootViewController = viewController
        animateWindow()
    }
    
    private func animateWindow() {
        guard let window = window else { return }
        
        UIView.transition(
            with: window,
            duration: .default,
            options: .transitionCrossDissolve,
            animations: nil
        )
    }
    
}
