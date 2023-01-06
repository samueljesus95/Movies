//
//  MOvieRequest.swift
//  Movies
//
//  Created by Samuel Nascimento de Jesus on 25/08/22.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

struct NetworkRequest {
    let baseURL: String
    let path: String
    let method: HTTPMethod
    let headers: [String : String]
    let queryParameters: [String : String]?
    let bodyParameter: [String : String]?

    private var urlComponent: URLComponents? {
        URLComponents(string: self.baseURL + self.path)
    }

    private var urlQueryParameters: [URLQueryItem] {
        var queryParameters = [URLQueryItem]()
        self.queryParameters?.forEach {
            let urlQueryParameter = URLQueryItem(name: $0.key, value: $0.value)
            queryParameters.append(urlQueryParameter)
        }

        return queryParameters
    }

    func createURLRequest() throws -> URLRequest {
        guard var urlComponent = self.urlComponent else {
            throw NetworkRequestError.couldNotGetURLComponent
        }

        urlComponent.queryItems = self.urlQueryParameters

        guard let url = urlComponent.url else {
            throw NetworkRequestError.couldNotCreateURL
        }

        return self.urlRequest(from: url)
    }

    private func urlRequest(from url: URL) -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = self.method.rawValue
        urlRequest.allHTTPHeaderFields = self.headers

        return urlRequest
    }
}
