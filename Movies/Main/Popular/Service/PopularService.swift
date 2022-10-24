//
//  HomeService.swift
//  Movies
//
//  Created by Samuel Nascimento de Jesus on 18/08/22.
//

import Foundation

struct PopularService {
    let popular: MovieType = .popular
    var path: String {
        return baseURL + popular.url
    }
}
