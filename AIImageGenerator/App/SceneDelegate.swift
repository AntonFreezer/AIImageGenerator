//
//  SceneDelegate.swift
//  AIImageGenerator
//
//  Created by Anton Kholodkov on 05.03.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    //MARK: - Properties
    var window: UIWindow?
    private let appFlow = HomeFlow()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = appFlow.navigationController
        window.makeKeyAndVisible()
        self.window = window
        
        appFlow.start()
    }

}

