//
//  AppsResult.swift
//  AppStoreJSON
//
//  Created by Mederbek on 27/10/22.
//

import Foundation

struct AppGroup:Decodable {
  let feed: Feed
}

struct Feed: Decodable {
  let title: String
  let results: [FeedResult]
}

struct FeedResult: Decodable {
  let name, artistName, artworkUrl100: String
}
