//
//  PopularMock.swift
//  MoviesTests
//
//  Created by Samuel Nascimento de Jesus on 23/12/22.
//

import Foundation
@testable import Movies

struct PopularMock {
    static let popularFirst = Popular(
        id: 76600,
        poster_path: "/5ScPNT6fHtfYJeWBajZciPV3hEL.jpg",
        adult: false,
        overview: "Set more than a decade after the events of the first film, learn the story of the Sully family (Jake, Neytiri, and their kids), the trouble that follows them, the lengths they go to keep each other safe, the battles they fight to stay alive, and the tragedies they endure.",
        release_date: "2022-12-14",
        genre_ids: [878,28,12],
        original_title: "Avatar: The Way of Water",
        original_language: "en",
        title: "Avatar: The Way of Water",
        backdrop_path: "/tQ91wWQJ2WRNDXwxuO7GCXX5VPC.jpg",
        popularity: 4109.455,
        vote_count: 1001,
        video: false,
        vote_average: 8.1,
        total_results: nil
    )

    static let popularSecond = Popular(
        id: 436270,
        poster_path: "/pFlaoHTZeyNkG83vxsAJiGzfSsa.jpg",
        adult: false,
        overview: "Nearly 5,000 years after he was bestowed with the almighty powers of the Egyptian gods—and imprisoned just as quickly—Black Adam is freed from his earthly tomb, ready to unleash his unique form of justice on the modern world.",
        release_date: "2022-10-19",
        genre_ids: [28,14,878],
        original_title: "Black Adam",
        original_language: "en",
        title: "Black Adam",
        backdrop_path: "/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg",
        popularity: 3189.94,
        vote_count: 3170,
        video: false,
        vote_average: 7.2,
        total_results: nil
    )

    static let popularWithOneMovie = PopularResult(
        page: 1,
        total_results: 1,
        total_pages: 1,
        results: [popularFirst])

    static let popularWithTwoMovie = PopularResult(
        page: 1,
        total_results: 1,
        total_pages: 1,
        results: [popularFirst, popularSecond])
}
