//
//  HomeService.swift
//  Movies
//
//  Created by Samuel Nascimento de Jesus on 18/08/22.
//

import Foundation

struct MovieRequest: NetworkRequest {
    private let apiKey: String = "c34fc967e6169896047f01a9ca55619b"
    
    var url: String {
        return "https://api.themoviedb.org/3/movie/"
    }
    var queryParameters: [String : String]? {
        ["apiKey" : apiKey]
    }
    var method: HTTPMethod {
        .get
    }
    var headers: [String : String] {
        [:]
    }
    var bodyParameter: [String : String]? {
        [:]
    }
    
    func decode(_ data: Data) throws -> [Movie] {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(MovieResult.self, from: data)
        return response.results
    }
}
