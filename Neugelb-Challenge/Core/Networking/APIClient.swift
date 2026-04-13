//
//  APIClient.swift
//  Neugelb-Challenge
//
//  Created by Taranjeet Kaur on 11/04/26.
//

import Foundation
import os

private let log = Logger(subsystem: "MovieApp", category: "network")

final class APIClient {
  
  static let shared = APIClient()
  private init() {}
  
  func fetch<T: Decodable>(_ endpoint: APIEndpoint) async throws -> T {
    
    guard let url = endpoint.url else {
      throw NetworkError.badURL
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = endpoint.method.rawValue
    
    log.info("➡️ \(request.httpMethod ?? "") \(url.absoluteString)")
    
    do {
      let (data, response) = try await URLSession.shared.data(for: request)
      
      guard let http = response as? HTTPURLResponse else {
        throw NetworkError.invalidResponse
      }
      
      guard 200..<300 ~= http.statusCode else {
        throw NetworkError.statusCode(http.statusCode)
      }
      
      guard !data.isEmpty else {
        throw NetworkError.noData
      }
      
      do {
        return try JSONDecoder().decode(T.self, from: data)
      } catch {
        throw NetworkError.decoding(error)
      }
      
    } catch let error as NetworkError {
      log.error("❌ \(error.localizedDescription)")
      throw error
    } catch {
      log.error("❌ \(error.localizedDescription)")
      throw NetworkError.request(error)
    }
  }
}
