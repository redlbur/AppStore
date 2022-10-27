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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: cellId)
    collectionView.register(AppsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
    fetchData()
  }
  
  var topFreeApps: AppsResult?
  
  fileprivate func fetchData() {
    print("Fetching new JSON DATA somehow...")
    Service.shared.fetchApplications { appResult, err in
      if let err = err {
        print("Failed to fetch apps:", err)
        return
      }
     
      self.topFreeApps = appResult
      DispatchQueue.main.async {
        self.collectionView.reloadData()
      }
    }
  }
  
  override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
    return header
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    return .init(width: view.frame.width, height: 300)
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 1
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsGroupCell
    cell.titleLabel.text = topFreeApps?.feed.title
    cell.horizontalController.appResult = topFreeApps
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
