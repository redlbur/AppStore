//
//  AppSearchController.swift
//  AppStoreJSON
//
//  Created by Mederbek on 8/10/22.
//

import UIKit
import SDWebImage

class AppSearchController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
  
  fileprivate let cellId = "SearchID"
  
  fileprivate let searchController = UISearchController(searchResultsController: nil)
  
  fileprivate let enterSearchTermLabel: UILabel = {
    let label = UILabel()
    label.text = "Please enter search term above..."
    label.textAlignment = .center
    label.font = UIFont.boldSystemFont(ofSize: 20)
    label.textColor = UIColor(white: 0, alpha: 0.3)
    return label
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.backgroundColor = .white
    collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellId)
    
    collectionView.addSubview(enterSearchTermLabel)
    enterSearchTermLabel.fillSuperview(padding: .init(top: 150, left: 50, bottom: 0, right: 50))
    setupSearchBar()
    //fetchITunesApps()
  }
  
  fileprivate func setupSearchBar() {
    definesPresentationContext = true
    navigationItem.searchController = self.searchController
    navigationItem.hidesSearchBarWhenScrolling = false
    searchController.searchBar.delegate = self
  }
  
  var timer: Timer?
  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    print(searchText)
    
    // instroduce some delay before performing the search
    // throttling the search
    timer?.invalidate()
    timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { _ in
      Service.shared.fetchApps(searchTerm: searchText) { res, err in
        self.appResult = res
        DispatchQueue.main.async {
          self.collectionView.reloadData()
        }
      }
    })
  }
  
  fileprivate var appResult = [Result]()
  
  fileprivate func fetchITunesApps() {
    Service.shared.fetchApps(searchTerm: "Twitter") { results,err  in
      
      if let err = err {
        print("Failed to fetch apps:", err) 
        return
      }
      
      self.appResult = results
      DispatchQueue.main.async {
        self.collectionView.reloadData()
      }
    }
  }
  
  
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return .init(width: view.frame.width, height: 350)
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    enterSearchTermLabel.isHidden = appResult.count != 0
    return appResult.count
    }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchResultCell
    cell.appResult = appResult[indexPath.row]
    return cell
  }
  
  
  
  
  
  init() {
    super.init(collectionViewLayout: UICollectionViewFlowLayout())
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
