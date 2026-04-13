//
//  FetchMoviesUseCaseTests.swift
//  Neugelb-Challenge
//
//  Created by Taranjeet Kaur on 13/04/26.
//

import XCTest
@testable import Neugelb_Challenge

final class FetchMoviesUseCaseTests: XCTestCase {

    func testExecuteSuccess() async throws {
        let mockRepo = MockMovieRepository()
        let page = TestDataFactory.makeMoviePage()

        mockRepo.moviesResult = .success(page)

        let useCase = FetchMoviesUseCase(repository: mockRepo)

        let result = try await useCase.execute(page: 1)

        XCTAssertEqual(result.results.count, 1)
    }

    func testExecuteFailure() async {
        let mockRepo = MockMovieRepository()
        mockRepo.moviesResult = .failure(NetworkError.noData)

        let useCase = FetchMoviesUseCase(repository: mockRepo)

        do {
            _ = try await useCase.execute(page: 1)
            XCTFail("Expected failure")
        } catch {
            XCTAssertTrue(true)
        }
    }
}
