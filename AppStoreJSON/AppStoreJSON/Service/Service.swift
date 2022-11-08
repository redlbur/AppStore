//
//  Service.swift
//  AppStoreJSON
//
//  Created by Mederbek on 26/10/22.
//

import Foundation

class Service {
  static let shared = Service() //singleton
  
  func fetchApps(searchTerm: String, completion: @escaping ([Result], Error?) -> ()) {
    
    let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
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
  
  func fetchTopFree(completion: @escaping (AppGroup?, Error?) -> ()) {
    let urlString = "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/50/apps.json"
    fetchAppGroup(urlString: urlString, completion: completion)
  }
  
  func fetchTopMusic(completion: @escaping (AppGroup?, Error?) -> ()) {
    let urlString = "https://rss.applemarketingtools.com/api/v2/us/music/most-played/50/songs.json"
    fetchAppGroup(urlString: urlString, completion: completion)
  }
  
  func fetchAppGroup(urlString: String, completion: @escaping (AppGroup?, Error?) -> Void) {
    guard let url = URL(string: urlString) else { return }
    
    URLSession.shared.dataTask(with: url) { data, response, err in
      if let err = err {
        print("Failed to fetch apps:", err)
        completion(nil, err)
        return
      }
      
      guard let data = data else { return }
      do {
        let appResult = try JSONDecoder().decode(AppGroup.self, from: data)
        completion(appResult, nil)
        
      } catch let jsonError {
        print("Failed to decode json:", jsonError)
        completion(nil, jsonError)
      }
 
    }.resume()
  }
  
  func fetchSocialApps(completion: @escaping ([SocialApp]?, Error?) -> Void) {
    let urlString = "https://api.letsbuildthatapp.com/appstore/social"
    
    guard let url = URL(string: urlString) else { return }
    
    URLSession.shared.dataTask(with: url) { data, response, err in
      if let err = err {
        print("Failed to fetch apps:", err)
        completion(nil, err)
        return
      }
      
      guard let data = data else { return }
      do {
        let socialApp = try JSONDecoder().decode([SocialApp].self, from: data)
        completion(socialApp, nil)
        
      } catch let jsonError {
        print("Failed to decode json:", jsonError)
        completion(nil, jsonError)
      }
 
    }.resume()
    
  }
}
