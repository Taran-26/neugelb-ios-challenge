//
//  MoviePosterView.swift
//  Neugelb-Challenge
//
//  Created by Taranjeet Kaur on 13/04/26.
//

import SwiftUI

struct MoviePosterView: View {
  
  let url: String?
  
  var body: some View {
    AsyncImage(url: posterURL) { image in
      image.resizable()
    } placeholder: {
      Color.gray.opacity(0.2)
    }
    .frame(width: 80, height: 120)
    .clipShape(RoundedRectangle(cornerRadius: 8))
  }
  
  private var posterURL: URL? {
    guard let url else { return nil }
    return URL(string: Constants.imageBase + url)
  }
}
