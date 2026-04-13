//
//  MovieAPI.swift
//  Neugelb-Challenge
//
//  Created by Taranjeet Kaur on 11/04/26.
//

import Foundation

final class MovieAPI {
  
  private let client: APIClient
  
  init(client: APIClient = .shared) {
    self.client = client
  }
  
  func fetchMovies(page: Int) async throws -> MoviePage {
    try await client.fetch(MovieEndpoint.list(page: page))
  }
  
  func fetchMovieDetail(id: Int) async throws -> MovieDetail {
    try await client.fetch(MovieEndpoint.detail(id: id))
  }
  
  func searchMovies(query: String, page: Int) async throws -> MoviePage {
    try await client.fetch(MovieEndpoint.search(query: query, page: page))
  }
  
  func searchSuggestions(query: String) async throws -> [Movie] {
    let page = try await client.fetch(MovieEndpoint.search(query: query, page: 1)) as MoviePage
    return page.results
  }
}
