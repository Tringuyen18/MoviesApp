//
//  SceneDelegate.swift
//  MoviesApp
//
//  Created by Nguyễn Trí on 13/08/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScence = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScence)
        self.window = window
        window.makeKeyAndVisible()
        
        createTabar()
    }
    
    func createTabar() {
        // Top
        let topVC = TopViewController()
        let topNav = BaseNavigationController(rootViewController: topVC)
        topNav.tabBarItem = UITabBarItem(title: "TopRating", image: UIImage(named: "ic-top"), selectedImage: UIImage(named: "ic-top"))
        topNav.tabBarItem.badgeColor = .red
        
        
        // Trend
        let trendVC = TrendViewController()
        let trendNav = BaseNavigationController(rootViewController: trendVC)
        trendNav.tabBarItem = UITabBarItem(title: "Trending", image: UIImage(named: "ic-trend1"), selectedImage: UIImage(named: "ic-trend2"))
        trendNav.tabBarItem.badgeColor = .red
        
        // Tabbar
        let tabbarController = BaseTabbarController()
        tabbarController.viewControllers = [trendNav, topNav]
        tabbarController.tabBar.tintColor = .red
        tabbarController.tabBar.barStyle = .default
        window?.rootViewController = tabbarController

    }

    static func shared() -> SceneDelegate {
        let scene = UIApplication.shared.connectedScenes.first
        return (scene?.delegate as? SceneDelegate)!
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }


}

