//
//  NetworkError.swift
//  Neugelb-Challenge
//
//  Created by Taranjeet Kaur on 13/04/26.
//

import Foundation

enum NetworkError: LocalizedError {
  case badURL
  case request(Error)
  case invalidResponse
  case statusCode(Int)
  case noData
  case decoding(Error)
  
  var errorDescription: String? {
    switch self {
      case .badURL:
        return "Invalid URL."
      case .request(let error):
        return error.localizedDescription
      case .invalidResponse:
        return "Invalid server response."
      case .statusCode(let code):
        return "Server error with status code \(code)."
      case .noData:
        return "No data received."
      case .decoding(let error):
        return "Decoding failed: \(error.localizedDescription)"
    }
  }
}
