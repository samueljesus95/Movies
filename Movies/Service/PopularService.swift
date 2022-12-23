//
//  PopularService.swift
//  Movies
//
//  Created by Samuel Nascimento de Jesus on 23/12/22.
//

import Foundation

protocol PopularServiceProtocol {
    func loadData(completion: @escaping (Result<[Popular], ErrorResponse>) -> Void)
}

class PopularService: PopularServiceProtocol {
    private let networkManager: NetworkManagerProtocol

    init(networkManager: NetworkManagerProtocol = DefaultNetworkService()) {
        self.networkManager = networkManager
    }

    func loadData(completion: @escaping (Result<[Popular], ErrorResponse>) -> Void) {
        let request = NetworkRequest(path: MovieType.popular.path, method: .get, headers: ["Content-Type" : "application/json"])
        networkManager.request(request) { (_ result: Result<PopularResult, ErrorResponse>) in
            switch result {
            case .success(let popular):
                completion(.success(popular.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
