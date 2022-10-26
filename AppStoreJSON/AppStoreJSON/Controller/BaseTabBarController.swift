//
//  BaseTabBarController.swift
//  AppStoreJSON
//
//  Created by Mederbek on 8/10/22.
//

import UIKit

class BaseTabBarController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    viewControllers = [
      createNavController(viewController: AppSearchController(), title: "Search", imageName: "search.png"),
      createNavController(viewController: UIViewController(), title: "Today", imageName: "today_icon.png"),
      createNavController(viewController: UIViewController(), title: "Apps", imageName: "apps.png")
      
    ]
  }
  
  fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
    
    let appearance = UINavigationBarAppearance()
    appearance.configureWithOpaqueBackground()
    appearance.backgroundColor = UIColor(white: 1, alpha: 1)
    
    viewController.navigationItem.title = title
    viewController.view.backgroundColor = .white
    
    let navController = UINavigationController(rootViewController: viewController)
    navController.tabBarItem.title = title
    navController.tabBarItem.image = UIImage(named: imageName)
    navController.navigationBar.prefersLargeTitles = true
    navController.navigationBar.isTranslucent = true
    
    navController.navigationBar.standardAppearance = appearance
    navController.navigationBar.scrollEdgeAppearance = navController.navigationBar.standardAppearance
    
    tabBar.backgroundColor = UIColor(white: 0.8, alpha: 0.5)
    tabBar.isTranslucent = true
    
    return navController
    
  }
  
  
}
