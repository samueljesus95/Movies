//
//  MoviesManager.swift
//  Movies
//
//  Created by Samuel Nascimento de Jesus on 09/08/22.
//

import Foundation

struct NetworkManager {
    func performRequest(request: NetworkRequest) {
        // estudar Result -> nativo swift
        // func request<T: Codable>(_ route: NetworkRequest, completion: @escaping (Result<T, Error>) -> Void)
        // let resquest_url = "\(request.path)?api_key=\(api_key)"
        let resquest_url = "\(request.path)"
        let url = URL(string: resquest_url)!
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error)
                return
            }
            
            if let safeData = data {
                if let movies = parseJSON(data: safeData) {
                    print(movies)
                }
            }
        }
        task.resume()
    }
}

func parseJSON(data: Data) -> MovieResult? {
    let decoder = JSONDecoder()
    do {
        let movies = try decoder.decode(MovieResult.self, from: data)
        return movies
    } catch {
        print(error)
        return nil
    }
}
