//
//  AppsHeaderHorizontalController.swift
//  AppStoreJSON
//
//  Created by Mederbek on 27/10/22.
//

import UIKit

class AppsHeaderHorizontalController: BaseListController, UICollectionViewDelegateFlowLayout {
  
  let cellId = "CellID"
  
  var socialApps = [SocialApp]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.backgroundColor = .white
    
    collectionView.register(AppsHeaderCell.self, forCellWithReuseIdentifier: cellId)
    
    if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
      layout.scrollDirection = .horizontal
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return .init(width: view.frame.width - 48, height: view.frame.height )
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return .init(top: 0, left: 16, bottom: 0, right: 16)
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return socialApps.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsHeaderCell
    let app = self.socialApps[indexPath.row]
    cell.companyLabel.text = app.name
    cell.titleLabel.text = app.tagline
    cell.imageView.sd_setImage(with: URL(string: app.imageUrl))
    return cell
  }
}
