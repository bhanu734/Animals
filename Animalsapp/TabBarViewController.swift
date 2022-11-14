//
//  TabBarViewController.swift
//  Animalsapp
//
//  Created by Mac on 12/11/22.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

       setupTabBar()
       setupControllers()
    }
    
    func setupTabBar() {
        tabBar.tintColor = UIColor(named: "AppColor")
        tabBar.unselectedItemTintColor = UIColor.darkGray
        tabBar.backgroundColor = UIColor.white.withAlphaComponent(0.8)
    }
    func setupControllers(){
        let browseController = BrowseViewController(nibName: "BrowseViewController", bundle: nil)
            browseController.tabBarItem = UITabBarItem(title: "Browse", image: UIImage(systemName: "square.grid.2x2"), selectedImage: UIImage(systemName: "square.grid.2x2"))
        let watchController = WatchViewController(nibName: "WatchViewController", bundle: nil)
            watchController.tabBarItem = UITabBarItem(title: "Watch", image: UIImage(systemName: "play.rectangle"), selectedImage: UIImage(systemName: "play.rectangle"))
        let locationControlller = LocationViewController(nibName: "LocationViewController", bundle: nil)
            locationControlller.tabBarItem = UITabBarItem(title: "Location", image: UIImage(systemName: "map"), selectedImage: UIImage(systemName: "map"))
        let galleryController = GalleryViewController(nibName: "GalleryViewController", bundle: nil)
            galleryController.tabBarItem = UITabBarItem(title: "Gallery", image: UIImage(systemName: "photo"), selectedImage: UIImage(systemName: "photo"))
        
        viewControllers = [browseController, watchController, locationControlller, galleryController]
    }

}
