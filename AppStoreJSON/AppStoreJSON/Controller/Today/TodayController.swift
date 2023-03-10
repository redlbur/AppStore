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
    
    collectionView.backgroundColor = #colorLiteral(red: 0.9360449314, green: 0.9360449314, blue: 0.937254902, alpha: 1)
    navigationController?.isNavigationBarHidden = true
    collectionView.register(TodayCell.self, forCellWithReuseIdentifier: cellId)
  }
  
  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    let todayFullscreenController = TodayFullscreenController()
    guard let redView = todayFullscreenController.view else { return }
    view.addSubview(redView)
    redView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleRemoveRedView)))
    
    addChild(todayFullscreenController)
    
    guard let cell = collectionView.cellForItem(at: indexPath) else { return }
    guard let startingFrame = cell.superview?.convert(cell.frame, to: nil) else { return }
    self.startingfFrame = startingFrame
    redView.frame = startingFrame
    redView.layer.cornerRadius = 16
    
    UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
      redView.frame = self.view.frame
      self.tabBarController?.tabBar.frame.origin.y += 100
    }, completion: nil)
  }
  
  var startingfFrame: CGRect?
  
  @objc func handleRemoveRedView(gesture: UITapGestureRecognizer) {
    UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseInOut) {
      gesture.view?.frame = self.startingfFrame ?? .zero
      self.tabBarController?.tabBar.frame.origin.y -= 100

    } completion: { _ in
      gesture.view?.removeFromSuperview()
    }
  }
  
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 5
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TodayCell
    return cell
  }
  
}

extension TodayController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return .init(width: view.frame.width - 64, height: 450)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 32
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return .init(top: 32, left: 0, bottom: 32, right: 0)
  }
}
