//
//  PopularServiceTest.swift
//  MoviesTests
//
//  Created by Samuel Nascimento de Jesus on 23/12/22.
//

import XCTest
@testable import Movies

final class PopularServiceTest: XCTestCase {
    var sut: PopularService!
    var networkMock: NetworkManagerMock!

    override func setUpWithError() throws {
        networkMock = NetworkManagerMock()
        sut = PopularService(networkManager: networkMock)
    }

    override func tearDownWithError() throws {
        networkMock = nil
        sut = nil
    }

    func testShouldLoadDataWithValidRequestValues() throws {
        let requestExpected = NetworkRequest(path: MovieType.popular.path, method: .get, headers: ["Content-Type" : "application/json"])

        sut.loadData { _ in }

        XCTAssertTrue(networkMock.didCallRequest)
        XCTAssertEqual(requestExpected.path, networkMock.requestReceived?.path)
        XCTAssertEqual(requestExpected.method, networkMock.requestReceived?.method)
        XCTAssertEqual(requestExpected.headers, networkMock.requestReceived?.headers)
    }

    func testShouldLoadDataWithSuccess() {

    }

    func testShouldLoadDataWithFailure() {

    }
}
