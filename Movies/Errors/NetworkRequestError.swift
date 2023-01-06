//
//  NetworkRequestError.swift
//  Movies
//
//  Created by Samuel Nascimento de Jesus on 06/01/23.
//

import Foundation

enum NetworkRequestError: Error {
    case couldNotGetURLComponent
    case couldNotCreateURL

    public var description: String {
        switch self {
        case .couldNotGetURLComponent: return "We found a error with baseURL or path."
        case .couldNotCreateURL: return "We found a error when tried create a URL with parameters."
        }
    }
}
