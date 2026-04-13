//
//  FetchMovieDetailUseCaseTests.swift
//  Neugelb-Challenge
//
//  Created by Taranjeet Kaur on 13/04/26.
//

import XCTest
@testable import Neugelb_Challenge

final class FetchMovieDetailUseCaseTests: XCTestCase {

    func testExecuteSuccess() async throws {
        let mockRepo = MockMovieRepository()
        let detail = TestDataFactory.makeMovieDetail()

        mockRepo.movieDetailResult = .success(detail)

        let useCase = FetchMovieDetailUseCase(repository: mockRepo)

        let result = try await useCase.execute(id: 1)

        XCTAssertEqual(result.id, 1)
    }
}
