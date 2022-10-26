//
//  Service.swift
//  AppStoreJSON
//
//  Created by Mederbek on 26/10/22.
//

import Foundation

class Service {
  static let shared = Service() //singleton
  
  func fetchApps(completion: @escaping ([Result], Error?) -> ()) {
    
    let urlString = "https://itunes.apple.com/search?term=instagram&entity=software"
    guard let url = URL(string: urlString) else { return }
    
    URLSession.shared.dataTask(with: url) { data, response, err in
      if let err = err {
        print("Failed to fetch apps:", err)
        completion([], nil)
        return
      }

      guard let data = data else { return }
      do {
        let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
        print("Fetching itunes apps from Service layer")
        completion(searchResult.results, nil)
        
      } catch let jsonError {
        print("Failed to decode json:", jsonError)
        completion([], jsonError)
      }
      
    }.resume() //fires off the request
  }
}
