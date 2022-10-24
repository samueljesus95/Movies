//
//  MoviesModel.swift
//  Movies
//
//  Created by Samuel Nascimento de Jesus on 11/08/22.
//

import Foundation

struct MovieResult: Decodable {
    let page: Int
    let totalResults: Int
    let totalPages: Int
    let results: [Movie]
}

struct Movie: Decodable {
    let id: Int
    let poster_path: String?
    let adult: Bool
    let overview: String
    let release_date: String
    let genre_ids: [Int]
    let original_title: String
    let original_language: String
    let title: String
    let backdrop_path: String?
    let popularity: Double
    let vote_count: Int
    let video: Bool
    let vote_average: Double
    let total_results: Int
}
