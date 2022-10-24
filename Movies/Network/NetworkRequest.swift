//
//  MOvieRequest.swift
//  Movies
//
//  Created by Samuel Nascimento de Jesus on 25/08/22.
//

import Foundation

enum HTTPMethod: String {
    case GET = "get"
    case POST = "post"
    case PUT = "put"
    case DELETE = "delete"
    case PATCH = "patch"
}

struct NetworkRequest {
    let path: String
    let method: HTTPMethod
    let header: [String : String]
    let queryParameter: [String : Any]?
    let bodyParameter: [String : Any]?
}
