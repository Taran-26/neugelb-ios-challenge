//
//  MovieDetailViewModel.swift
//  Neugelb-Challenge
//
//  Created by Taranjeet Kaur on 13/04/26.
//

import Foundation

@MainActor
final class MovieDetailViewModel: ObservableObject {
  
  // MARK: - Dependencies
  private let fetchMovieDetailUseCase: FetchMovieDetailUseCase
  
  // MARK: - State
  @Published private(set) var movie: MovieDetail?
  @Published private(set) var isLoading = false
  @Published private(set) var errorMessage: String?
  
  private let movieId: Int
  
  // MARK: - Init
  init(
    movieId: Int,
    fetchMovieDetailUseCase: FetchMovieDetailUseCase
  ) {
    self.movieId = movieId
    self.fetchMovieDetailUseCase = fetchMovieDetailUseCase
  }
  
  // MARK: - Public
  func load() async {
    isLoading = true
    errorMessage = nil
    
    defer { isLoading = false }
    
    do {
      movie = try await fetchMovieDetailUseCase.execute(id: movieId)
    } catch {
      errorMessage = error.localizedDescription
    }
  }
}
