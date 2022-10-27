//
//  AppRowCell.swift
//  AppStoreJSON
//
//  Created by Mederbek on 27/10/22.
//

import UIKit

class AppRowCell: UICollectionViewCell {
  
  let imageView = UIImageView(cornerRadius: 8)
  
  let nameLabel = UILabel(text: "App Name", font: .systemFont(ofSize: 20))
  let companyName = UILabel(text: "Company Name", font: .systemFont(ofSize: 13))
  
  let getButton = UIButton(title: "GET")
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    imageView.backgroundColor = .purple
    imageView.widthAnchor.constraint(equalToConstant: 64).isActive = true
    imageView.heightAnchor.constraint(equalToConstant: 64).isActive = true
    
    getButton.backgroundColor = UIColor(white: 0.93, alpha: 1)
    getButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
    getButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
    getButton.layer.cornerRadius = 16
    getButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
    
    companyName.textColor = UIColor(white: 0, alpha: 0.3)
    
    let stackView = UIStackView(arrangedSubviews: [
      imageView,
      VerticalStackView(arrangedSubviews: [nameLabel, companyName], spacing: 4),
      getButton
    ])
    
    stackView.spacing = 16
    
    stackView.alignment = .center
    addSubview(stackView)
    stackView.fillSuperview()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
