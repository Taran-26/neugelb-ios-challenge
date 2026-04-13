//
//  SearchSuggestionsUseCase.swift
//  Neugelb-Challenge
//
//  Created by Taranjeet Kaur on 13/04/26.
//

struct SearchSuggestionsUseCase {
  
  private let repository: MovieRepository
  
  init(repository: MovieRepository = MovieRepositoryImpl()) {
    self.repository = repository
  }
  
  func execute(query: String) async throws -> [Movie] {
    try await repository.searchSuggestions(query: query)
  }
}
