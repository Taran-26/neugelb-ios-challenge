//
//  MovieGenresView.swift
//  Neugelb-Challenge
//
//  Created by Taranjeet Kaur on 13/04/26.
//

import SwiftUI

struct MovieGenresView: View {
  
  let movie: MovieDetail
  
  var body: some View {
    
    VStack(alignment: .leading, spacing: 16) {
      
      Text("Genres")
        .font(.headline)
      
      ScrollView(.horizontal, showsIndicators: false) {
        
        HStack(spacing: 8) {
          ForEach(movie.genres) { genre in
            
            Text(genre.name)
              .font(.caption)
              .padding(.horizontal, 12)
              .padding(.vertical, 6)
              .background(Color.blue.opacity(0.12))
              .clipShape(Capsule())
          }
        }
      }
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .padding(.horizontal, 20)
  }
}
