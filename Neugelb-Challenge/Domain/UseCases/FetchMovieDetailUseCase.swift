//
//  FetchMovieDetailUseCase.swift
//  Neugelb-Challenge
//
//  Created by Taranjeet Kaur on 13/04/26.
//

struct FetchMovieDetailUseCase {
  
  private let repository: MovieRepository
  
  init(repository: MovieRepository = MovieRepositoryImpl()) {
    self.repository = repository
  }
  
  func execute(id: Int) async throws -> MovieDetail {
    try await repository.getMovieDetail(id: id)
  }
}
