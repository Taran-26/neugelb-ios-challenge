//
//  SearchMoviesUseCase.swift
//  Neugelb-Challenge
//
//  Created by Taranjeet Kaur on 13/04/26.
//

struct SearchMoviesUseCase {
  
  private let repository: MovieRepository
  
  init(repository: MovieRepository = MovieRepositoryImpl()) {
    self.repository = repository
  }
  
  func execute(query: String, page: Int) async throws -> MoviePage {
    try await repository.searchMovies(query: query, page: page)
  }
}
