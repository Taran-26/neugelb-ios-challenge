//
//  MovieRepository.swift
//  Neugelb-Challenge
//
//  Created by Taranjeet Kaur on 13/04/26.
//

protocol MovieRepository {
  func getMovies(page: Int) async throws -> MoviePage
  func getMovieDetail(id: Int) async throws -> MovieDetail
  func searchMovies(query: String, page: Int) async throws -> MoviePage
  func searchSuggestions(query: String) async throws -> [Movie]
}
