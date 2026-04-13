//
//  FetchMoviesUseCase.swift
//  Neugelb-Challenge
//
//  Created by Taranjeet Kaur on 11/04/26.
//

struct FetchMoviesUseCase {
  
  private let repository: MovieRepository
  
  init(repository: MovieRepository = MovieRepositoryImpl()) {
    self.repository = repository
  }
  
  func execute(page: Int) async throws -> MoviePage {
    try await repository.getMovies(page: page)
  }
}
