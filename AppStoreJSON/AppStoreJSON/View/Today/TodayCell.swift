//
//  TodayCell.swift
//  AppStoreJSON
//
//  Created by Mederbek on 9/3/23.
//

import UIKit

class TodayCell: UICollectionViewCell {
  
  let image = UIImageView(image: UIImage(named: "garden"))
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = .white
    layer.cornerRadius = 16
    
    addSubview(image)
    image.contentMode = .scaleAspectFill
    image.centerInSuperview(size: .init(width: 250, height: 250))
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
