//
//  AppSearchController.swift
//  AppStoreJSON
//
//  Created by Mederbek on 8/10/22.
//

import UIKit

class AppSearchController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  
  fileprivate let cellId = "SearchID"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.backgroundColor = .white
    collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellId)
    
    fetchITunesApps()
  }
  
  fileprivate var appResult = [Result]()
  
  // 2 - Extract this function fetchITunesApps() outside of this controller file
  
  fileprivate func fetchITunesApps() {
    Service.shared.fetchApps { results,err  in
      
      if let err = err {
        print("Failed to fetch apps:", err)
        return
      }
      
      self.appResult = results
      DispatchQueue.main.async {
        self.collectionView.reloadData()
      }
    }
    
    // we need to get back our search results somehow
    // use a completion block
  }
  
  
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return .init(width: view.frame.width, height: 350)
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return appResult.count
    }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchResultCell
    let appResult = appResult[indexPath.row]
    cell.nameLabel.text = appResult.trackName
    cell.categoryLabel.text = appResult.primaryGenreName
    cell.ratingsLabel.text = "Rating: \(String(format: "%.1f", appResult.averageUserRating ?? 0))"
    return cell
  }
  
  
  
  
  
  init() {
    super.init(collectionViewLayout: UICollectionViewFlowLayout())
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
