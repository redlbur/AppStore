//
//  AppsController.swift
//  AppStoreJSON
//
//  Created by Mederbek on 27/10/22.
//

import Foundation
import UIKit

class AppsPageController: BaseListController, UICollectionViewDelegateFlowLayout {
  
  let cellId = "AppsID"
  let headerId = "HeaderID"
  
  let activityIndicatorView: UIActivityIndicatorView = {
    let aiv = UIActivityIndicatorView(style: .large )
    aiv.color = .black
    aiv.startAnimating()
    aiv.hidesWhenStopped = true
    return aiv
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: cellId)
    collectionView.register(AppsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
    
    view.addSubview(activityIndicatorView)
    activityIndicatorView.fillSuperview()
    fetchData()
  }
  
  var socialApps = [SocialApp]()
  var groups = [AppGroup]()
  
  fileprivate func fetchData() {
    
    var group1: AppGroup?
    var group2: AppGroup?
    var group3: AppGroup?
    
    //help you sync your data fetches together
    let dispatchGroup = DispatchGroup()
    
    
//    dispatchGroup.enter()
//    Service.shared.fetchTopMusic { appGroup, err in
//      dispatchGroup.leave()
//      if let group = appGroup {
//        self.groups.append(group)
//      }
//      DispatchQueue.main.async {
//        self.collectionView.reloadData()
//      }
//    }
    
    dispatchGroup.enter()
    Service.shared.fetchTopMusic { appGroup, err in
      dispatchGroup.leave()
      group1 = appGroup
    }
    
    dispatchGroup.enter()
    Service.shared.fetchTopFree { appGroup, err in
      dispatchGroup.leave()
      group2 = appGroup
    }
    
    dispatchGroup.enter()
    Service.shared.fetchAppGroup(urlString: "https://rss.applemarketingtools.com/api/v2/us/books/top-free/50/books.json") { appGroup, err in
      dispatchGroup.leave()
      group3 = appGroup
    }
    
    dispatchGroup.enter()
    Service.shared.fetchSocialApps { apps, err in
      dispatchGroup.leave()
      self.socialApps = apps ?? []
    }
    
    //completion
    dispatchGroup.notify(queue: .main) {
      print("completed your dispatch group task...")
      self.activityIndicatorView.stopAnimating()
      
      if let group = group1 {
        self.groups.append(group)
      }
      if let group = group2 {
        self.groups.append(group)
      }
      if let group = group3 {
        self.groups.append(group)
      }
      self.collectionView.reloadData()
    }
  }
  
  override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! AppsPageHeader
    header.appHeaderHorizontalController.socialApps = self.socialApps
    header.appHeaderHorizontalController.collectionView.reloadData()
    return header
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    return .init(width: view.frame.width, height: 300)
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return groups.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsGroupCell
    
    let appGroup = groups[indexPath.row]
    
    cell.titleLabel.text = appGroup.feed.title
    cell.horizontalController.appResult = appGroup
    cell.horizontalController.collectionView.reloadData()
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return .init(width: view.frame.width, height: 300)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return .init(top: 16, left: 0, bottom: 0, right: 0)
  }
  
}
