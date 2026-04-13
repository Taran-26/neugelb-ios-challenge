//
//  MoviesListViewModel.swift
//  Neugelb-Challenge
//
//  Created by Taranjeet Kaur on 11/04/26.
//

import Foundation

@MainActor
final class MoviesListViewModel: ObservableObject {
  
  // MARK: - Dependencies
  private let fetchMoviesUseCase: FetchMoviesUseCase
  private let searchMoviesUseCase: SearchMoviesUseCase
  private let searchSuggestionsUseCase: SearchSuggestionsUseCase
  
  // MARK: - Output
  @Published private(set) var movies: [Movie] = []
  @Published private(set) var suggestions: [Movie] = []
  @Published private(set) var isLoading = false
  @Published private(set) var errorMessage: String?
  
  // MARK: - Input
  @Published var searchQuery: String = ""
  
  // MARK: - Pagination
  private var currentPage = 1
  private var totalPages = 1
  private var isFetching = false
  
  // MARK: - Tasks
  private var searchTask: Task<Void, Never>?
  private var suggestionTask: Task<Void, Never>?
  
  // MARK: - Init
  init(
    fetchMoviesUseCase: FetchMoviesUseCase,
    searchMoviesUseCase: SearchMoviesUseCase,
    searchSuggestionsUseCase: SearchSuggestionsUseCase
  ) {
    self.fetchMoviesUseCase = fetchMoviesUseCase
    self.searchMoviesUseCase = searchMoviesUseCase
    self.searchSuggestionsUseCase = searchSuggestionsUseCase
  }
}

extension MoviesListViewModel {
  
  func loadInitial() async {
    resetAll()
    await loadMovies()
  }
  
  func refresh() async {
    resetAll()
    await loadMovies()
  }
  
  func search(query: String) {
    searchTask?.cancel()
    
    let trimmed = query.trimmingCharacters(in: .whitespacesAndNewlines)
    
    searchTask = Task { [weak self] in
      guard let self else { return }
      
      try? await Task.sleep(nanoseconds: 300_000_000) // debounce
      guard !Task.isCancelled else { return }
      
      await self.performSearch(trimmed)
    }
  }
  
  func fetchSuggestions(query: String) {
    suggestionTask?.cancel()
    
    let trimmed = query.trimmingCharacters(in: .whitespacesAndNewlines)
    
    guard trimmed.count >= 2 else {
      suggestions = []
      return
    }
    
    suggestionTask = Task { [weak self] in
      guard let self else { return }
      
      try? await Task.sleep(nanoseconds: 250_000_000) // debounce
      guard !Task.isCancelled else { return }
      
      await self.loadSuggestions(trimmed)
    }
  }
  
  func loadMoreIfNeeded(current movie: Movie) async {
    guard !isFetching else { return }
    guard movie.id == movies.last?.id else { return }
    guard currentPage <= totalPages else { return }
    
    await loadMovies(loadMore: true)
  }
  
  func selectSuggestion(_ movie: Movie) {
    searchQuery = movie.title
    clearSuggestions()
    search(query: movie.title)
  }
}

private extension MoviesListViewModel {
  
  func performSearch(_ query: String) async {
    searchQuery = query
    resetPagination()
    await loadMovies()
  }
  
  func loadMovies(loadMore: Bool = false) async {
    
    guard !isFetching else { return }
    guard currentPage <= totalPages else { return }
    
    isFetching = true
    isLoading = !loadMore
    
    defer {
      isFetching = false
      isLoading = false
    }
    
    do {
      let response: MoviePage
      
      if searchQuery.isEmpty {
        response = try await fetchMoviesUseCase.execute(page: currentPage)
      } else {
        response = try await searchMoviesUseCase.execute(
          query: searchQuery,
          page: currentPage
        )
      }
      
      if loadMore {
        movies.append(contentsOf: response.results)
      } else {
        movies = response.results
      }
      
      totalPages = response.totalPages
      currentPage += 1
      
    } catch {
      errorMessage = error.localizedDescription
    }
  }
  
  func loadSuggestions(_ query: String) async {
    do {
      let results = try await searchSuggestionsUseCase.execute(query: query)
      suggestions = Array(results.prefix(5))
    } catch {
      suggestions = []
    }
  }
}

private extension MoviesListViewModel {
  
  func clearSuggestions() {
    suggestions = []
  }
  
  func resetAll() {
    searchTask?.cancel()
    suggestionTask?.cancel()
    
    movies = []
    suggestions = []
    currentPage = 1
    totalPages = 1
    errorMessage = nil
  }
  
  func resetPagination() {
    currentPage = 1
    totalPages = 1
    movies = []
  }
}
