//
//  MoviesManager.swift
//  Movies
//
//  Created by Samuel Nascimento de Jesus on 09/08/22.
//

import Foundation

//MARK: - network protocol
protocol NetworkManagerProtocol: AnyObject {
    func request<T: Codable>(_ request: NetworkRequest, completion: @escaping (Result<T, Error>) -> Void)
}

//MARK: - implementation of network protocol
final class DefaultNetworkService: NetworkManagerProtocol {
    func request<T>(_ request: NetworkRequest, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable, T : Encodable {

        do {
            let urlRequest = try request.createURLRequest()

            URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                DispatchQueue.main.async {
                    if error != nil {
                        return completion(.failure(NetworkManagerError.connectionFailedWithAPI))
                    }

                    guard let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode else {
                        return completion(.failure(NetworkManagerError.invalidResponse))
                    }

                    guard let data = data else {
                        return completion(.failure(NetworkManagerError.noData))
                    }

                    do {
                        let response = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(response))
                    } catch {
                        completion(.failure(NetworkManagerError.serializationError))
                    }
                }
            }
            .resume()
        } catch {
            completion(.failure(error))
        }
    }
}
