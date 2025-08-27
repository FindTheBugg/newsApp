//
//  SceneDelegate.swift
//  newsApp
//
//  Created by gurtovoy.v on 15.08.2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        let secondVC = SecondViewController()
        let firstVC = FirstViewController()
        let thirdVC = ThirdViewController()
        
        secondVC.tabBarItem = UITabBarItem(
            title: "Избранное",
            image: UIImage(systemName: "star.circle"),
            selectedImage: UIImage(systemName: "star.circle.fill")
        )
        
        firstVC.tabBarItem = UITabBarItem(
            title: "Новости",
            image: UIImage(systemName: "newspaper"),
            selectedImage: UIImage(systemName: "newspaper.fill")
        )
        
        thirdVC.tabBarItem = UITabBarItem(
            title: "Профиль",
            image: UIImage(systemName: "person.circle.fill"),
            selectedImage: UIImage(systemName: "person.circle")
        )
        
        let secondNav = UINavigationController(rootViewController: secondVC)
        let firstNav = UINavigationController(rootViewController: firstVC)
        let thirdNav = UINavigationController(rootViewController: thirdVC)
        
        let tabBarController = UITabBarController()
        
        tabBarController.viewControllers = [secondNav, firstNav, thirdNav]
        tabBarController.selectedIndex = 1
        tabBarController.tabBar.tintColor = .systemBlue
        tabBarController.tabBar.unselectedItemTintColor = .gray
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        
        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
    
    
}
