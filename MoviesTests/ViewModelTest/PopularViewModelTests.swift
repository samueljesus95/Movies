//
//  PopularViewModelTests.swift
//  MoviesTests
//
//  Created by Samuel Nascimento de Jesus on 23/12/22.
//

import XCTest
@testable import Movies

final class PopularViewModelTests: XCTestCase {

    var sut: PopularViewModel!
    var popularServiceMock: PopularServiceMock!

    override func setUpWithError() throws {
        popularServiceMock = PopularServiceMock()
        sut = PopularViewModel(popularServiceProtocol: popularServiceMock)
    }

    override func tearDownWithError() throws {
        sut = nil
        popularServiceMock = nil
    }

    func testShouldCallLoadData() throws {
        sut.fetch()
        XCTAssertTrue(popularServiceMock.didCallLoadData)
    }

    func testShouldLoadDataWithOneMovie() {
        popularServiceMock.isSucess = true
        sut.fetch()
        XCTAssertEqual(sut.popularItens.count, 1)
    }

    func testShoulLoadDataWithTwoMovies() {
        popularServiceMock.isSucess = true
        popularServiceMock.mockResult = PopularMock.popularWithTwoMovie.results
        sut.fetch()
        XCTAssertEqual(sut.popularItens.count, 2)
    }

    func testShouldLoadDataWithFailure() {
        sut.fetch()
        XCTAssertEqual(sut.popularItens.count, 0)
    }
}
