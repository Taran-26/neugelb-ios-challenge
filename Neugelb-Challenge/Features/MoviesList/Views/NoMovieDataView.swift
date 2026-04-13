//
//  NoMovieDataView.swift
//  Neugelb-Challenge
//
//  Created by Taranjeet Kaur on 13/04/26.
//

import SwiftUI

struct NoMovieDataView: View {
  
  var message: String
  
  var body: some View {
    VStack(spacing: 12) {
      Image(systemName: "film")
        .font(.system(size: 50))
        .foregroundStyle(.gray.opacity(0.6))
      
      Text(message)
        .font(.headline)
        .foregroundStyle(.secondary)
    }
    .padding()
  }
}
