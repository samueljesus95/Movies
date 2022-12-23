//
//  MovieType.swift
//  Movies
//
//  Created by Samuel Nascimento de Jesus on 11/08/22.
//

import Foundation

enum MovieType {
    case popular
    
    var path: String {
        switch self {
        case .popular: return "/popular"
        }
    }

    var description: String {
        switch self {
        case .popular: return "Popular"
        }
    }
}
