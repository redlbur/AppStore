//
//  AppsController.swift
//  AppStoreJSON
//
//  Created by Mederbek on 27/10/22.
//

import Foundation
import UIKit

class AppsController: BaseListController, UICollectionViewDelegateFlowLayout {
  
  let cellId = "AppsID"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: cellId)
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 5
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsGroupCell
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return .init(width: view.frame.width, height: 300)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return .init(top: 16, left: 0, bottom: 0, right: 0)
  }
  
}
