//
//  MoviesListContentView.swift
//  Neugelb-Challenge
//
//  Created by Taranjeet Kaur on 13/04/26.
//

import SwiftUI

struct MoviesListContentView: View {
  
  @ObservedObject var viewModel: MoviesListViewModel
  
  var body: some View {
    VStack(spacing: 0) {
      
      MovieSearchSectionView(viewModel: viewModel)
      Spacer()
      if viewModel.isLoading && viewModel.movies.isEmpty {
        LoadingView(message: "Loading movies...")
        
      } else if viewModel.movies.isEmpty {
        NoMovieDataView(message: "No movies found")
        
      } else {
        movieList
      }
      Spacer()
    }
  }
  
  private var movieList: some View {
    ScrollView {
      LazyVStack(spacing: 12) {
        
        ForEach(viewModel.movies) { movie in
          NavigationLink(value: movie) {
            MovieRowView(movie: movie)
          }
          .buttonStyle(.plain)
          .onAppear {
            Task {
              await viewModel.loadMoreIfNeeded(current: movie)
            }
          }
        }
        
        if viewModel.isLoading {
          LoadingView()
            .frame(height: 80)
        }
      }
      .padding(.horizontal)
    }
  }
}
