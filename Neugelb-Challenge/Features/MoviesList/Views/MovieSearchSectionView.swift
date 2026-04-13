//
//  MovieSearchSectionView.swift
//  Neugelb-Challenge
//
//  Created by Taranjeet Kaur on 13/04/26.
//

import SwiftUI

struct MovieSearchSectionView: View {
  
  @ObservedObject var viewModel: MoviesListViewModel
  
  var body: some View {
    VStack(spacing: 8) {
      
      SearchBarView(
        text: $viewModel.searchQuery,
        onChange: { query in
          viewModel.search(query: query)
          viewModel.fetchSuggestions(query: query)
        }
      )
      .padding(.horizontal)
      .padding(.top)
      
      if !viewModel.suggestions.isEmpty {
        suggestionList
      }
    }
  }
  
  private var suggestionList: some View {
    VStack(alignment: .leading, spacing: 0) {
      
      ForEach(viewModel.suggestions) { movie in
        Button {
          viewModel.selectSuggestion(movie)
        } label: {
          HStack {
            Text(movie.title)
              .foregroundStyle(.primary)
              .lineLimit(1)
            
            Spacer()
          }
          .padding()
        }
        
        if movie.id != viewModel.suggestions.last?.id {
          Divider()
        }
      }
    }
    .background(Color(.systemBackground))
    .clipShape(RoundedRectangle(cornerRadius: 10))
    .shadow(color: .black.opacity(0.1), radius: 8)
    .padding(.horizontal)
  }
}
