//
//  ErrorResponse.swift
//  Movies
//
//  Created by Samuel Nascimento de Jesus on 02/11/22.
//

import Foundation

enum ErrorResponse: String {
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    
    public var description: String {
        switch self {
        case .apiError: return "Erro na api"
        case .invalidEndpoint: return "Erro com o endpoint"
        case .invalidResponse: return "Error com a resposta"
        case .noData: return "Sem dados para a requisição"
        }
    }
}
