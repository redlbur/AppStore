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
      createNavController(viewController: TodayController(), title: "Today", imageName: "today_icon.png"),
      createNavController(viewController: AppsPageController(), title: "Apps", imageName: "apps.png"),
      createNavController(viewController: AppSearchController(), title: "Search", imageName: "search.png")
    ]
  }
  
  fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
    
//    let appearance = UINavigationBarAppearance()
//    appearance.configureWithOpaqueBackground()
    //appearance.backgroundColor = UIColor(white: 1, alpha: 0.95)
    
    let navController = UINavigationController(rootViewController: viewController)
    navController.tabBarItem.title = title
    navController.tabBarItem.image = UIImage(named: imageName)
    navController.navigationBar.prefersLargeTitles = true
    viewController.navigationItem.title = title
    viewController.view.backgroundColor = .white
    
    //navController.navigationBar.isTranslucent = true
    
    //navController.navigationBar.standardAppearance = appearance
    //navController.navigationBar.scrollEdgeAppearance = navController.navigationBar.standardAppearance
    
    //tabBar.backgroundColor = UIColor(white: 0.93, alpha: 0.5)
    //tabBar.isTranslucent = true
    
    return navController
    
  }
  
  
}
