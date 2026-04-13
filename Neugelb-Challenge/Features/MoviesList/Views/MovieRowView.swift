//
//  MovieRowView.swift
//  Neugelb-Challenge
//
//  Created by Taranjeet Kaur on 13/04/26.
//

import SwiftUI

struct MovieRowView: View {
  
  let movie: Movie
  
  var body: some View {
    HStack(spacing: 12) {
      
      MoviePosterView(url: movie.posterPath)
      
      VStack(alignment: .leading, spacing: 6) {
        
        Text(movie.title)
          .font(.headline)
          .lineLimit(2)
        
        Text(movie.overview)
          .font(.subheadline)
          .foregroundStyle(.secondary)
          .lineLimit(3)
        
        Spacer(minLength: 6)
        
        HStack {
          Text("⭐ \(String(format: "%.1f", movie.voteAverage))")
            .font(.caption)
            .foregroundStyle(.orange)
          
          Spacer()
          
          
          Text("🎬 \(movie.releaseYear)")
            .font(.caption2)
            .foregroundStyle(.secondary)
          
        }
      }
    }
    .padding(.vertical, 8)
  }
}
