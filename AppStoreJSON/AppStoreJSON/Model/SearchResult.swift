//
//  SearchResult.swift
//  AppStoreJSON
//
//  Created by Mederbek on 26/10/22.
//

import Foundation

struct SearchResult: Decodable {
  let resultCount: Int
  let results: [Result]
}

struct Result: Decodable {
  let trackName: String
  let primaryGenreName: String
  var averageUserRating: Float?
  let screenshotUrls: [String]
  let artworkUrl100: String // appicon
  let formattedPrice: String
  let description: String
  let releaseNotes: String
}
