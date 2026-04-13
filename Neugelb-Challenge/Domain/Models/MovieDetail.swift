//
//  MovieDetail.swift
//  Neugelb-Challenge
//
//  Created by Taranjeet Kaur on 13/04/26.
//

import Foundation

struct MovieDetail: Decodable, Identifiable {
  let id: Int
  let title: String
  let overview: String
  let backdropPath: String?
  let posterPath: String?
  let releaseDate: String?
  let runtime: Int?
  let voteAverage: Double
  let genres: [Genre]
  let tagline: String?
  
  var backdropURL: URL? {
    guard let backdropPath else { return nil }
    return URL(string: Constants.imageBase + backdropPath)
  }
  
  var posterURL: URL? {
    guard let posterPath else { return nil }
    return URL(string: Constants.imageBase + posterPath)
  }
  
  enum CodingKeys: String, CodingKey {
    case id, title, overview, runtime, genres, tagline
    case backdropPath = "backdrop_path"
    case posterPath = "poster_path"
    case releaseDate = "release_date"
    case voteAverage = "vote_average"
  }
}

struct Genre: Decodable, Identifiable, Equatable {
  let id: Int
  let name: String
}
