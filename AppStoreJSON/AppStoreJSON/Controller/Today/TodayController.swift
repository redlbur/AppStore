//
//  TodayController.swift
//  AppStoreJSON
//
//  Created by Mederbek on 9/3/23.
//

import UIKit

class TodayController: BaseListController {
  
  private let cellId = "TodayCellId"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.backgroundColor = .yellow
    collectionView.register(TodayCell.self, forCellWithReuseIdentifier: cellId)
  }
  
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 5
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TodayCell
    //cell.backgroundColor = .white
    return cell
  }
  
}
