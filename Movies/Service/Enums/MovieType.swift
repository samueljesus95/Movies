//
//  MovieType.swift
//  Movies
//
//  Created by Samuel Nascimento de Jesus on 11/08/22.
//

import Foundation

enum MovieType {
    case latest
    case popular
    
    var path: String {
        switch self {
        case .latest: return "/latest"
        case .popular: return "/popular"
        }
    }
}
