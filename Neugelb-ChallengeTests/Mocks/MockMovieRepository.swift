//
//  MockMovieRepository.swift
//  Neugelb-Challenge
//
//  Created by Taranjeet Kaur on 13/04/26.
//

@testable import Neugelb_Challenge

final class MockMovieRepository: MovieRepository {

    var moviesResult: Result<MoviePage, Error>?
    var movieDetailResult: Result<MovieDetail, Error>?
    var searchResult: Result<MoviePage, Error>?
    var suggestionsResult: Result<[Movie], Error>?

    func getMovies(page: Int) async throws -> MoviePage {
        try moviesResult!.get()
    }

    func getMovieDetail(id: Int) async throws -> MovieDetail {
        try movieDetailResult!.get()
    }

    func searchMovies(query: String, page: Int) async throws -> MoviePage {
        try searchResult!.get()
    }

    func searchSuggestions(query: String) async throws -> [Movie] {
        try suggestionsResult!.get()
    }
}
