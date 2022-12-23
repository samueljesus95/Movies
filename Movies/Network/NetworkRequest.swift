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
    var path: String
    var method: HTTPMethod
    var headers: [String : String]
    var queryParameters: [String : String]?
    var bodyParameter: [String : String]?
}
