//
//  NetworkManagerMock.swift
//  MoviesTests
//
//  Created by Samuel Nascimento de Jesus on 23/12/22.
//

import Foundation
@testable import Movies

class NetworkManagerMock: NetworkManagerProtocol {
    typealias T = Codable

    var requestReceived: NetworkRequest?
    var didCallRequest = false
    var isSuccess = false
    var mockResult: T?

    func request<T>(_ request: Movies.NetworkRequest, completion: @escaping (Result<T, Movies.NetworkManagerError>) -> Void) where T : Decodable, T : Encodable {
        didCallRequest = true
        requestReceived = request

        isSuccess ? completion(.success(mockResult as! T)) : completion(.failure(.noData))
    }
}
