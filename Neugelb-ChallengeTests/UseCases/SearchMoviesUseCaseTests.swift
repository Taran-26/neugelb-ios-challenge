//
//  SearchMoviesUseCaseTests.swift
//  Neugelb-Challenge
//
//  Created by Taranjeet Kaur on 13/04/26.
//

import XCTest
@testable import Neugelb_Challenge

final class SearchMoviesUseCaseTests: XCTestCase {

    func testSearchSuccess() async throws {
        let mockRepo = MockMovieRepository()
        let page = TestDataFactory.makeMoviePage()

        mockRepo.searchResult = .success(page)

        let useCase = SearchMoviesUseCase(repository: mockRepo)

        let result = try await useCase.execute(query: "batman", page: 1)

        XCTAssertEqual(result.results.count, 1)
    }
}
