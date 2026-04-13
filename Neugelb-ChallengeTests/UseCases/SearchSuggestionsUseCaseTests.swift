//
//  SearchSuggestionsUseCaseTests.swift
//  Neugelb-Challenge
//
//  Created by Taranjeet Kaur on 13/04/26.
//

import XCTest
@testable import Neugelb_Challenge

final class SearchSuggestionsUseCaseTests: XCTestCase {

    func testSuggestionsSuccess() async throws {
        let mockRepo = MockMovieRepository()
        let movies = [TestDataFactory.makeMovie()]

        mockRepo.suggestionsResult = .success(movies)

        let useCase = SearchSuggestionsUseCase(repository: mockRepo)

        let result = try await useCase.execute(query: "bat")

        XCTAssertEqual(result.count, 1)
    }
}
