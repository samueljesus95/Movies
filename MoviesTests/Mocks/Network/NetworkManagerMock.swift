//
//  NetworkManagerMock.swift
//  MoviesTests
//
//  Created by Samuel Nascimento de Jesus on 23/12/22.
//

import Foundation
@testable import Movies

class NetworkManagerMock: NetworkManagerProtocol {
    func request<T>(_ request: Movies.NetworkRequest, completion: @escaping (Result<T, Movies.ErrorResponse>) -> Void) where T : Decodable, T : Encodable {
        <#code#>
    }

    
}
