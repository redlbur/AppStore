//
//  SearchResultCell.swift
//  AppStoreJSON
//
//  Created by Mederbek on 9/10/22.
//

import UIKit

class SearchResultCell: UICollectionViewCell {
  
  let imageView: UIImageView = {
    let iv = UIImageView()
    iv.backgroundColor = .red
    return iv
  }()
  
  let nameLabel: UILabel = {
    let label = UILabel()
    label.text = "APP NAME"
    return label
  }()
  
  let getButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("GET", for: .normal)
    button.setTitleColor(.blue, for: .normal)
    button.titleLabel?.font = .boldSystemFont(ofSize: 14)
    return button
  }()
    
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = .green
    
    let stackView = UIStackView(arrangedSubviews: [
      imageView,
      nameLabel,
      getButton
    ])
    stackView.spacing = 12
    
    addSubview(stackView)
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
