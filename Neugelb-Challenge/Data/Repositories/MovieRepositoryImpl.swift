//
//  MovieRepositoryImpl.swift
//  Neugelb-Challenge
//
//  Created by Taranjeet Kaur on 13/04/26.
//

final class MovieRepositoryImpl: MovieRepository {
  
  private let api: MovieAPI
  
  init(api: MovieAPI = MovieAPI()) {
    self.api = api
  }
  
  func getMovies(page: Int) async throws -> MoviePage {
    try await api.fetchMovies(page: page)
  }
  
  func getMovieDetail(id: Int) async throws -> MovieDetail {
    try await api.fetchMovieDetail(id: id)
  }
  
  func searchMovies(query: String, page: Int) async throws -> MoviePage {
    try await api.searchMovies(query: query, page: page)
  }
  
  func searchSuggestions(query: String) async throws -> [Movie] {
    try await api.searchSuggestions(query: query)
  }
}
