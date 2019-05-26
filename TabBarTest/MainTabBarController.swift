//
//  MainTabBarController.swift
//  TabBarTest
//
//  Created by Eduardo David De La Cruz Marrero on 25/05/2019.
//  Copyright © 2019 eduardodelacruz. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    var restrictionViewModel: RestrictionsViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    func setupTabBar() {
        
        restrictionViewModel = RestrictionsViewModel(withMainOutputController: self)
        
        tabBar.barTintColor = .green
        
        let videoController = createNavController(withViewController: VideoViewController(), selectedImageName: "video_black", unselectedImageName: "video_white")
        
        let favoriteController = createNavController(withViewController: FavoriteViewController(), selectedImageName: "star_black", unselectedImageName: "star_white")
        
        viewControllers = [videoController, favoriteController]
        
        NotificationCenter.default.addObserver(self, selector: #selector(didBecomeActive), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    @objc func didBecomeActive() {
        
        guard let currentNavController = self.selectedViewController as? UINavigationController,
            let currentViewController = currentNavController.topViewController as? RestrictionsOutput
        else {
            restrictionViewModel?.check()
            return
        }
        restrictionViewModel?.check(outputController: currentViewController)
    }
}

extension MainTabBarController {
    
    func createNavController(withViewController vC: UIViewController, selectedImageName: String, unselectedImageName: String) -> UINavigationController {
        
        let navController = UINavigationController(rootViewController: vC)
        
        navController.tabBarItem.selectedImage = UIImage(named: selectedImageName)?.withRenderingMode(.alwaysOriginal)
        navController.tabBarItem.image = UIImage(named: unselectedImageName)?.withRenderingMode(.alwaysOriginal)
        navController.tabBarItem.imageInsets = UIEdgeInsets(top: 10, left: 0, bottom: -10, right: 0)
        
        return navController
    }
}

extension MainTabBarController: RestrictionsOutput {
    
    func restrictionsDidChanged(isRestricted: Bool) {
        tabBar.items?[1].isEnabled = !isRestricted
    }
}
