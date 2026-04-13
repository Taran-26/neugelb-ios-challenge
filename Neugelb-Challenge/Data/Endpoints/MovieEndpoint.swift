//
//  MovieEndpoint.swift
//  Neugelb-Challenge
//
//  Created by Taranjeet Kaur on 13/04/26.
//

import Foundation

enum MovieEndpoint: APIEndpoint {
  
  case list(page: Int)
  case detail(id: Int)
  case search(query: String, page: Int)
  
  var path: String {
    switch self {
      case .list:
        return "discover/movie"
      case .detail(let id):
        return "movie/\(id)"
      case .search:
        return "search/movie"
    }
  }
  
  var queryItems: [URLQueryItem]? {
    switch self {
      case .list(let page):
        return [
          URLQueryItem(name: "page", value: "\(page)")
        ]
        
      case .detail:
        return nil
        
      case .search(let query, let page):
        return [
          URLQueryItem(name: "query", value: query),
          URLQueryItem(name: "page", value: "\(page)")
        ]
    }
  }
}
