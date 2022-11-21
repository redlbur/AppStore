//
//  Service.swift
//  AppStoreJSON
//
//  Created by Mederbek on 26/10/22.
//

import Foundation

class Service {
  static let shared = Service() //singleton
  
  func fetchApps(searchTerm: String, completion: @escaping (SearchResult?, Error?) -> ()) {
    let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
    fetchGenericJSONData(urlString: urlString, completion: completion)
  }
  
  func fetchTopFree(completion: @escaping (AppGroup?, Error?) -> ()) {
    let urlString = "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/50/apps.json"
    fetchAppGroup(urlString: urlString, completion: completion)
  }
  
  func fetchTopMusic(completion: @escaping (AppGroup?, Error?) -> ()) {
    let urlString = "https://rss.applemarketingtools.com/api/v2/us/music/most-played/50/songs.json"
    fetchAppGroup(urlString: urlString, completion: completion)
  }
  
  //MARK: - Helper
  
  func fetchAppGroup(urlString: String, completion: @escaping (AppGroup?, Error?) -> Void) {
    fetchGenericJSONData(urlString: urlString, completion: completion)
  }
  
  func fetchSocialApps(completion: @escaping ([SocialApp]?, Error?) -> Void) {
    let urlString = "https://api.letsbuildthatapp.com/appstore/social"
    fetchGenericJSONData(urlString: urlString, completion: completion)
  }
  
  //MARK: - Generic JSONData
  
  func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> ()) {
    
    guard let url = URL(string: urlString) else { return }
    
    URLSession.shared.dataTask(with: url) { data, response, err in
      if let err = err {
        print("Failed to fetch apps:", err)
        completion(nil, err)
        return
      }
      
      guard let data = data else { return }
      do {
        let objects = try JSONDecoder().decode(T.self, from: data)
        completion(objects, nil)
        
      } catch let jsonError {
        print("Failed to decode json:", jsonError)
        completion(nil, jsonError)
      }
 
    }.resume()
  }
}
