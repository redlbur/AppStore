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
    
    
    let appearance = UINavigationBarAppearance()
    appearance.configureWithOpaqueBackground()
    appearance.backgroundColor = .lightGray
    
    
    let todayViewController = UIViewController()
    todayViewController.view.backgroundColor = .white
    todayViewController.navigationItem.title = "Today"
    
    let todayNavController = UINavigationController(rootViewController: todayViewController)
    todayNavController.tabBarItem.image = UIImage(named: "today_icon.png")
    todayNavController.tabBarItem.title = "Today"
    todayNavController.navigationBar.standardAppearance = appearance
    todayNavController.navigationBar.scrollEdgeAppearance = todayNavController.navigationBar.standardAppearance
    todayNavController.navigationBar.prefersLargeTitles = true
    

    let appsViewController = UIViewController()
    appsViewController.view.backgroundColor = .white
    appsViewController.navigationItem.title = "Apps"
    
    let appsNavController = UINavigationController(rootViewController: appsViewController)
    appsNavController.tabBarItem.image = UIImage(named: "apps.png")
    appsNavController.tabBarItem.title = "Apps"
    appsNavController.navigationBar.standardAppearance = appearance
    appsNavController.navigationBar.scrollEdgeAppearance = appsNavController.navigationBar.standardAppearance
    appsNavController.navigationBar.prefersLargeTitles = true
    
    
    let searchViewController = UIViewController()
    searchViewController.view.backgroundColor = .white
    searchViewController.navigationItem.title = "Search"
    
    let searchNavController = UINavigationController(rootViewController: searchViewController)
    searchNavController.tabBarItem.image = UIImage(named: "search.png")
    searchNavController.tabBarItem.title = "Search"
    searchNavController.navigationBar.standardAppearance = appearance
    searchNavController.navigationBar.scrollEdgeAppearance = searchNavController.navigationBar.standardAppearance
    searchNavController.navigationBar.prefersLargeTitles = true
    tabBar.backgroundColor = .lightGray
    tabBar.isTranslucent = true
    
    viewControllers = [
      todayNavController,
      appsNavController,
      searchNavController
    ]
  }
  
  
}
