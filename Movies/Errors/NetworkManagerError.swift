//
//  ErrorResponse.swift
//  Movies
//
//  Created by Samuel Nascimento de Jesus on 02/11/22.
//

import Foundation

enum NetworkManagerError: Error {
    case connectionFailedWithAPI
    case invalidResponse
    case noData
    case serializationError
    
    public var description: String {
        switch self {
        case .connectionFailedWithAPI: return "Failed to connect with API."
        case .invalidResponse: return "We found a error when we tried to valid the URL provider."
        case .noData: return "We didn't find data with parameters provider."
        case .serializationError: return "We found a error when we tried to serializaton data."
        }
    }
}
