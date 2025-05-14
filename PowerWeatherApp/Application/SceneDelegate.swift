//
//  SceneDelegate.swift
//  PowerWeatherApp
//
//  Created by Алексей on 13.05.2025.
//

import UIKit
import CoreData

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var coordinator: AppCoordinator?
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let container = appDelegate.persistentContainer
        
        let location = CoreDataManager(container: container)
        let nav = UINavigationController()
        coordinator = AppCoordinator(dataManger: location, navigationController: nav)
        coordinator?.start()
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
    }

    func sceneDidEnterBackground(_ scene: UIScene) {

        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
}

