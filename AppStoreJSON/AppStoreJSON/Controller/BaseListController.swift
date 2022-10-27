//
//  BaseListController.swift
//  AppStoreJSON
//
//  Created by Mederbek on 27/10/22.
//

import UIKit

class BaseListController: UICollectionViewController {
  
  init() {
    super.init(collectionViewLayout: UICollectionViewFlowLayout())
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
