//
//  MoviesManager.swift
//  Movies
//
//  Created by Samuel Nascimento de Jesus on 09/08/22.
//

import Foundation

protocol NetworkManagerProtocol: AnyObject {
    func request<T: Codable>(_ request: NetworkRequest, completion: @escaping (Result<T, ErrorResponse>) -> Void)
}

final class DefaultNetworkService: NetworkManagerProtocol {
    func request<T>(_ request: NetworkRequest, completion: @escaping (Result<T, ErrorResponse>) -> Void) where T : Decodable, T : Encodable {

        guard var urlComponent = URLComponents(string: baseUrl + request.path) else {
            return completion(.failure(.invalidEndpoint))
        }

        var queryParameters = [URLQueryItem(name: "api_key", value: apiKey)]
        request.queryParameters?.forEach {
            let urlQueryParameter = URLQueryItem(name: $0.key, value: $0.value)
            urlComponent.queryItems?.append(urlQueryParameter)
            queryParameters.append(urlQueryParameter)
        }

        urlComponent.queryItems = queryParameters

        guard let url = urlComponent.url else {
            return completion(.failure(.invalidResponse))
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.allHTTPHeaderFields = request.headers

        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            DispatchQueue.main.async {
                if error != nil {
                    return completion(.failure(.apiError))
                }

                guard let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode else {
                    return completion(.failure(.invalidResponse))
                }

                guard let data = data else {
                    return completion(.failure(.noData))
                }

                do {
                    let response = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(response))
                } catch {
                    completion(.failure(.serializationError))
                }
            }
        }
        .resume()
    }
}
