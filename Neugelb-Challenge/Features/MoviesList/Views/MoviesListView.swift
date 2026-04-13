//
//  MoviesListView.swift
//  Neugelb-Challenge
//
//  Created by Taranjeet Kaur on 11/04/26.
//

import SwiftUI

struct MoviesListView: View {
  
  @StateObject var viewModel: MoviesListViewModel
  @StateObject private var networkMonitor = NetworkMonitor.shared
  
  var body: some View {
    NavigationStack {
      VStack(spacing: 0) {
        
        OfflineBannerView(isConnected: networkMonitor.isConnected)
        
        MoviesListContentView(viewModel: viewModel)
      }
      .navigationTitle("Movies")
      .task { await viewModel.loadInitial() }
      .navigationDestination(for: Movie.self) { movie in
        MovieDetailView(
          viewModel: MovieDetailViewModel(
            movieId: movie.id,
            fetchMovieDetailUseCase: FetchMovieDetailUseCase()
          )
        )
      }
    }
  }
}
