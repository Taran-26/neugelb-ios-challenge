//
//  MoviePage.swift
//  Neugelb-Challenge
//
//  Created by Taranjeet Kaur on 11/04/26.
//

struct MoviePage: Decodable {
  let page: Int
  let results: [Movie]
  let totalPages: Int
  
  enum CodingKeys: String, CodingKey {
    case page, results
    case totalPages = "total_pages"
  }
}
