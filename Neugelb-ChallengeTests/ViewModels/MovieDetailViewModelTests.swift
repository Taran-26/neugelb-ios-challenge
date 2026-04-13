//
//  MovieDetailViewModelTests.swift
//  Neugelb-Challenge
//
//  Created by Taranjeet Kaur on 13/04/26.
//

import XCTest
@testable import Neugelb_Challenge

@MainActor
final class MovieDetailViewModelTests: XCTestCase {

    func testLoadSuccess() async {
        let mockRepo = MockMovieRepository()
        let detail = TestDataFactory.makeMovieDetail()

        mockRepo.movieDetailResult = .success(detail)

        let viewModel = MovieDetailViewModel(
            movieId: 1,
            fetchMovieDetailUseCase: FetchMovieDetailUseCase(repository: mockRepo)
        )

        await viewModel.load()

        XCTAssertEqual(viewModel.movie?.id, 1)
        XCTAssertNil(viewModel.errorMessage)
    }

    func testLoadFailure() async {
        let mockRepo = MockMovieRepository()
        mockRepo.movieDetailResult = .failure(NetworkError.noData)

        let viewModel = MovieDetailViewModel(
            movieId: 1,
            fetchMovieDetailUseCase: FetchMovieDetailUseCase(repository: mockRepo)
        )

        await viewModel.load()

        XCTAssertNotNil(viewModel.errorMessage)
    }
}
