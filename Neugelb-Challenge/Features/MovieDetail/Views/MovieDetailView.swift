//
//  MovieDetailView.swift
//  Neugelb-Challenge
//
//  Created by Taranjeet Kaur on 13/04/26.
//

import SwiftUI

struct MovieDetailView: View {
  
  @StateObject var viewModel: MovieDetailViewModel
  
  var body: some View {
    content
      .navigationTitle(viewModel.movie?.title ?? "Movie")
      .navigationBarTitleDisplayMode(.inline)
      .task {
        await viewModel.load()
      }
  }
}

// MARK: - Root State Handling
private extension MovieDetailView {
  
  @ViewBuilder
  var content: some View {
    if viewModel.isLoading {
      LoadingView(message: "Loading details...")
      
    } else if let movie = viewModel.movie {
      
      MovieDetailContentView(movie: movie)
      
    } else if let error = viewModel.errorMessage {
      ErrorView(
        message: error,
        onRetry: {
          Task {
            await viewModel.load()
          }
        }
      )
    }
  }
}
