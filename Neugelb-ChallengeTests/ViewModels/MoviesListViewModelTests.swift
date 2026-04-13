//
//  MoviesListViewModelTests.swift
//  Neugelb-Challenge
//
//  Created by Taranjeet Kaur on 13/04/26.
//

import XCTest
@testable import Neugelb_Challenge

@MainActor
final class MoviesListViewModelTests: XCTestCase {

    func testLoadInitialLoadsMovies() async {
        let mockRepo = MockMovieRepository()
        let page = TestDataFactory.makeMoviePage()

        mockRepo.moviesResult = .success(page)

        let viewModel = MoviesListViewModel(
            fetchMoviesUseCase: FetchMoviesUseCase(repository: mockRepo),
            searchMoviesUseCase: SearchMoviesUseCase(repository: mockRepo),
            searchSuggestionsUseCase: SearchSuggestionsUseCase(repository: mockRepo)
        )

        await viewModel.loadInitial()

        XCTAssertEqual(viewModel.movies.count, 1)
    }

    func testSearchUpdatesMovies() async {
        let mockRepo = MockMovieRepository()
        let page = TestDataFactory.makeMoviePage(
            movies: [TestDataFactory.makeMovie(title: "Search Result")]
        )

        mockRepo.searchResult = .success(page)

        let viewModel = MoviesListViewModel(
            fetchMoviesUseCase: FetchMoviesUseCase(repository: mockRepo),
            searchMoviesUseCase: SearchMoviesUseCase(repository: mockRepo),
            searchSuggestionsUseCase: SearchSuggestionsUseCase(repository: mockRepo)
        )

        viewModel.search(query: "test")

        try? await Task.sleep(nanoseconds: 400_000_000)

        XCTAssertEqual(viewModel.movies.first?.title, "Search Result")
    }

    func testLoadMorePagination() async {
        let mockRepo = MockMovieRepository()

        let firstPage = TestDataFactory.makeMoviePage(
            page: 1,
            totalPages: 2,
            movies: [TestDataFactory.makeMovie(id: 1)]
        )

        let secondPage = TestDataFactory.makeMoviePage(
            page: 2,
            totalPages: 2,
            movies: [TestDataFactory.makeMovie(id: 2)]
        )

        mockRepo.moviesResult = .success(firstPage)

        let viewModel = MoviesListViewModel(
            fetchMoviesUseCase: FetchMoviesUseCase(repository: mockRepo),
            searchMoviesUseCase: SearchMoviesUseCase(repository: mockRepo),
            searchSuggestionsUseCase: SearchSuggestionsUseCase(repository: mockRepo)
        )

        await viewModel.loadInitial()

        mockRepo.moviesResult = .success(secondPage)

        await viewModel.loadMoreIfNeeded(current: viewModel.movies.last!)

        XCTAssertEqual(viewModel.movies.count, 2)
    }
}
