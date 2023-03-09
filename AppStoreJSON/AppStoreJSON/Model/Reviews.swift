//
//  Reviews.swift
//  AppStoreJSON
//
//  Created by Mederbek on 22/11/22.
//

import Foundation

struct Reviews: Decodable {
  let feed: ReviewFeed
}

struct ReviewFeed: Decodable {
  let entry: [Entry]
}

struct Entry: Decodable {
  let author: Author
  let title: Label
  let content: Label
}

struct Author: Decodable {
  let name: Label
}

struct Label: Decodable {
  let label: String
}
