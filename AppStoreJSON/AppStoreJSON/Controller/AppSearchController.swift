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
  
  
  fileprivate func fetchITunesApps() {
    let urlString = "https://itunes.apple.com/search?term=instagram&entity=software"
    guard let url = URL(string: urlString) else { return }
    
    //fetch data from internet
    URLSession.shared.dataTask(with: url) { data, response, err in
      if let err = err {
        print("Failed to fetch apps:", err)
        return
      }
      
      //success
//      print(data)
//      print(String(data: data!, encoding: .utf8))
      guard let data = data else { return }
      
      do {
        let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
        searchResult.results.forEach({print($0.trackName, $0.primaryGenreName)})
      } catch let jsonError {
        print("Failed to decode json:", jsonError)
      }
      
    }.resume() //fires off the request
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return .init(width: view.frame.width, height: 350)
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return 5
    }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchResultCell
    cell.nameLabel.text = "HERE IS MY APP NAME"
    return cell
  }
  
  
  
  
  
  init() {
    super.init(collectionViewLayout: UICollectionViewFlowLayout())
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
