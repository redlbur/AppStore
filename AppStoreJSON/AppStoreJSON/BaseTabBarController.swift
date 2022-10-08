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
      createNavController(viewController: UIViewController(), title: "Today", imageName: "today_icon.png"),
      createNavController(viewController: UIViewController(), title: "Apps", imageName: "apps.png"),
      createNavController(viewController: UIViewController(), title: "Search", imageName: "search.png")
    ]
  }
  
  fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
    
    let appearance = UINavigationBarAppearance()
    appearance.configureWithOpaqueBackground()
    appearance.backgroundColor = .lightGray
    
    viewController.navigationItem.title = title
    viewController.view.backgroundColor = .white
    
    let navController = UINavigationController(rootViewController: viewController)
    navController.tabBarItem.title = title
    navController.tabBarItem.image = UIImage(named: imageName)
    navController.navigationBar.standardAppearance = appearance
    navController.navigationBar.scrollEdgeAppearance = navController.navigationBar.standardAppearance
    navController.navigationBar.prefersLargeTitles = true
    
    tabBar.backgroundColor = .lightGray
    tabBar.isTranslucent = true
    
    return navController
    
  }
  
  
}
