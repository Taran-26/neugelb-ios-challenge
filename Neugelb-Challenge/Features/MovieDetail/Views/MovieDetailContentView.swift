//
//  MovieDetailContentView.swift
//  Neugelb-Challenge
//
//  Created by Taranjeet Kaur on 13/04/26.
//

import SwiftUI

struct MovieDetailContentView: View {
  
  let movie: MovieDetail
  
  var body: some View {
    ScrollView {
      
      VStack(alignment: .leading, spacing: 20) {
        
        MovieBackdropView(movie: movie)
        
        VStack {
          MovieInfoView(movie: movie)
          MovieOverviewView(movie: movie)
          MovieGenresView(movie: movie)
        }
        .padding(.horizontal, 20)
      }
      
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding(.horizontal, 16)
      .padding(.vertical, 16)
    }
  }
}
