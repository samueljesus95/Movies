//
//  PopularServiceMock.swift
//  MoviesTests
//
//  Created by Samuel Nascimento de Jesus on 23/12/22.
//

import Foundation
@testable import Movies

class PopularServiceMock: PopularServiceProtocol {
    var didCallLoadData = false
    var isSucess = false
    var mockResult: [Popular] = PopularMock.popularWithOneMovie.results

    func loadData(completion: @escaping (Result<[Movies.Popular], Movies.NetworkManagerError>) -> Void) {
        didCallLoadData = true
        isSucess ? completion(.success(mockResult)) : completion(.failure(.apiError))
    }
}
