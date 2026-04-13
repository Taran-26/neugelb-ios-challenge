//
//  MovieBackdropView.swift
//  Neugelb-Challenge
//
//  Created by Taranjeet Kaur on 13/04/26.
//

import SwiftUI

struct MovieBackdropView: View {
  
  let movie: MovieDetail
  
  var body: some View {
    
    AsyncImage(url: movie.backdropURL) { phase in
      switch phase {
          
        case .success(let image):
          image
            .resizable()
            .scaledToFill()
          
        default:
          Color.gray.opacity(0.3)
      }
    }
    .frame(height: 260)
    .frame(maxWidth: .infinity)
    .clipped()
  }
}
