//
//  Endpoint.swift
//  Neugelb-Challenge
//
//  Created by Taranjeet Kaur on 11/04/26.
//

import Foundation

enum HTTPMethod: String {
  case GET
}

protocol APIEndpoint {
  var path: String { get }
  var queryItems: [URLQueryItem]? { get }
}

extension APIEndpoint {
  
  var baseURL: String {
    Constants.baseURL
  }
  
  var method: HTTPMethod {
    .GET
  }
  
  var apiKey: String {
    Constants.apiKey
  }
  
  var url: URL? {
    var components = URLComponents(string: baseURL + path)
    
    var items = queryItems ?? []
    items.append(URLQueryItem(name: "api_key", value: apiKey))
    
    components?.queryItems = items
    
    return components?.url
  }
}
