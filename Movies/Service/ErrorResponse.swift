//
//  ErrorResponse.swift
//  Movies
//
//  Created by Samuel Nascimento de Jesus on 02/11/22.
//

import Foundation

enum ErrorResponse: Error {
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case serializationError
    
    public var description: String {
        switch self {
        case .apiError: return "Failed to fetch data"
        case .invalidEndpoint: return "Invalid endpoint"
        case .invalidResponse: return "Invalid response"
        case .noData: return "Na data"
        case .serializationError: return "Failed to decode data"
        }
    }
}
