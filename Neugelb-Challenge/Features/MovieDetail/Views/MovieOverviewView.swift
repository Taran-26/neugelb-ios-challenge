//
//  MovieDetailOverview.swift
//  Neugelb-Challenge
//
//  Created by Taranjeet Kaur on 13/04/26.
//

import SwiftUI

struct MovieOverviewView: View {
  
  let movie: MovieDetail
  
  var body: some View {
    
    VStack(alignment: .leading, spacing: 10) {
      
      Text("Overview")
        .font(.headline)
      
      Text(movie.overview)
        .font(.body)
        .foregroundStyle(.secondary)
        .lineSpacing(2)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .padding(20)
  }
}
