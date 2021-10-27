//
//  SceneDelegate.swift
//  PropertySearch
//
//  Created by Dushyant Singh on 24/10/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let winScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: winScene)
        self.window?.rootViewController = MainCoordinator().mainNavigationController
        self.window?.makeKeyAndVisible()
    }
}

