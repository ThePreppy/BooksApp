//
//  SceneDelegate.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {

        guard let windowScene = scene as? UIWindowScene else {
            return
        }
        
        let navigationService = Container.navigationService
        window = navigationService.setup(with: windowScene)
        navigationService.start()
    }

}

