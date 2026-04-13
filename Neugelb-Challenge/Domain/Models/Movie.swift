//
//  Movie.swift
//  Neugelb-Challenge
//
//  Created by Taranjeet Kaur on 11/04/26.
//

import Foundation

struct Movie: Identifiable, Decodable, Hashable {
  let id: Int
  let title: String
  let overview: String
  let posterPath: String?
  let releaseDate: String?
  let voteAverage: Double
  
  var posterURL: URL? {
    guard let posterPath else { return nil }
    return URL(string: Constants.imageBase + posterPath)
  }
  
  var releaseYear: String {
    releaseDate?.toFormattedDate().components(separatedBy: " ").last ?? ""
  }
  
  enum CodingKeys: String, CodingKey {
    case id, title, overview
    case posterPath = "poster_path"
    case releaseDate = "release_date"
    case voteAverage = "vote_average"
  }
}
