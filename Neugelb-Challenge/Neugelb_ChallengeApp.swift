//
//  Neugelb_ChallengeApp.swift
//  Neugelb-Challenge
//
//  Created by Taranjeet Kaur on 11/04/26.
//

import SwiftUI

@main
struct Neugelb_ChallengeApp: App {
  // MARK: - Dependencies
  
  private let repository = MovieRepositoryImpl()
  private let fetchMoviesUseCase: FetchMoviesUseCase
  private let searchMoviesUseCase: SearchMoviesUseCase
  private let searchSuggestionsUseCase: SearchSuggestionsUseCase
  
  init() {
    self.fetchMoviesUseCase = FetchMoviesUseCase(repository: repository)
    self.searchMoviesUseCase = SearchMoviesUseCase(repository: repository)
    self.searchSuggestionsUseCase = SearchSuggestionsUseCase(repository: repository)
  }
  
  // MARK: - App Entry
  
  var body: some Scene {
    WindowGroup {
      MoviesListView(
        viewModel: MoviesListViewModel(
          fetchMoviesUseCase: fetchMoviesUseCase,
          searchMoviesUseCase: searchMoviesUseCase,
          searchSuggestionsUseCase: searchSuggestionsUseCase
        )
      )
    }
  }
}
