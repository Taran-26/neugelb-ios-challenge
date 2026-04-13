//
//  MovieInfoView.swift
//  Neugelb-Challenge
//
//  Created by Taranjeet Kaur on 13/04/26.
//

import SwiftUI

struct MovieInfoView: View {
  
  let movie: MovieDetail
  
  var body: some View {
    
    HStack(alignment: .top, spacing: 16) {
      
      AsyncImage(url: movie.posterURL) { image in
        image.resizable()
          .scaledToFill()
      } placeholder: {
        Color.gray.opacity(0.2)
      }
      .frame(width: 110, height: 160)
      .clipShape(RoundedRectangle(cornerRadius: 12))
      
      VStack(alignment: .leading, spacing: 8) {
        
        if let tagline = movie.tagline, !tagline.isEmpty {
          Text(tagline)
            .font(.subheadline)
            .foregroundStyle(.secondary)
            .italic()
            .lineLimit(3)
        }
        
        Label(
          String(format: "%.1f ⭐", movie.voteAverage),
          systemImage: "star.fill"
        )
        .font(.subheadline.weight(.semibold))
        .foregroundStyle(.yellow)
        
        if let runtime = movie.runtime {
          Label("\(runtime) min", systemImage: "clock")
            .font(.subheadline)
            .foregroundStyle(.secondary)
        }
        
        Label(movie.releaseDate?.toFormattedDate() ?? "-", systemImage: "calendar")
          .font(.subheadline)
          .foregroundStyle(.secondary)
        
        Spacer(minLength: 0)
      }
      
      Spacer(minLength: 0)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .padding(.horizontal, 20)
  }
}
