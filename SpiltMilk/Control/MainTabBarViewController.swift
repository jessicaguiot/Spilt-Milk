//
//  MainTabBarViewController.swift
//  Bookshelf
//
//  Created by Hiago Chagas on 15/05/20.
//  Copyright © 2020 Hiago Chagas. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        self.tabBar.tintColor = #colorLiteral(red: 0, green: 0.5137254902, blue: 0.5607843137, alpha: 1)
    }
    func setupTabBar(){
        let profileViewController = setupVc(rootViewController: LoginViewController(), image: UIImage(systemName: "person.fill")!, title: "Profile")
        let homeViewController = setupVc(rootViewController: HomeViewController(), image: UIImage(systemName: "house.fill")!, title: "Home")
        let favoritesViewController = setupVc(rootViewController: FavoritesViewController(), image: UIImage(systemName: "bookmark.fill")!, title: "Favorites")
        viewControllers = [profileViewController,homeViewController,favoritesViewController]
    }
    func setupVc(rootViewController: UIViewController, image: UIImage, title: String) -> UINavigationController{
        let viewController = UINavigationController(rootViewController: rootViewController)
        viewController.tabBarItem.image = image
        viewController.tabBarItem.selectedImage = image
        viewController.title = title
        return viewController
    }
}

