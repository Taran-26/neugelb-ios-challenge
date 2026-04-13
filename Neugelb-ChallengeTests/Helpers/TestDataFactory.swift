//
//  TestDataFactory.swift
//  Neugelb-Challenge
//
//  Created by Taranjeet Kaur on 13/04/26.
//

@testable import Neugelb_Challenge

enum TestDataFactory {

    static func makeMovie(id: Int = 1, title: String = "Mock Movie") -> Movie {
        Movie(
            id: id,
            title: title,
            overview: "Overview",
            posterPath: nil,
            releaseDate: "2024-01-01",
            voteAverage: 7.5
        )
    }

    static func makeMoviePage(
        page: Int = 1,
        totalPages: Int = 1,
        movies: [Movie] = [makeMovie()]
    ) -> MoviePage {
        MoviePage(
            page: page,
            results: movies,
            totalPages: totalPages
        )
    }

    static func makeMovieDetail(id: Int = 1) -> MovieDetail {
        MovieDetail(
            id: id,
            title: "Detail Movie",
            overview: "Detail Overview",
            backdropPath: nil,
            posterPath: nil,
            releaseDate: "2024-01-01",
            runtime: 120,
            voteAverage: 8.0,
            genres: [],
            tagline: "Tagline"
        )
    }
}
