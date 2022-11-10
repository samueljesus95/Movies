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

protocol NetworkRequest {
    associatedtype Response
    
    var url: String { get }
    var method: HTTPMethod { get }
    var headers: [String : String] { get }
    var queryParameters: [String : String]? { get }
    var bodyParameter: [String : String]? { get }
    
    func decode(_ data: Data) throws -> Response
}

extension NetworkRequest where Response: Decodable {
    func decode(_ data: Data) throws -> Response {
        let decoder = JSONDecoder()
        return try decoder.decode(Response.self, from: data)
    }
}

extension NetworkRequest {
    var headers: [String : String] {
        [:]
    }
    
    var queryParameters: [String : String] {
        [:]
    }
    
    var bodyParameter: [String : String] {
        [:]
    }
}
