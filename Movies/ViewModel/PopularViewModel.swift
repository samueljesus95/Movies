//
//  HomeViewModel.swift
//  Movies
//
//  Created by Samuel Nascimento de Jesus on 18/08/22.
//

import SwiftUI

class PopularViewModel: ObservableObject {

    @Published
    private(set) var popular: [Popular] = []
    private let networkManager: NetworkManagerProtocol

    init(networkManager: NetworkManagerProtocol = DefaultNetworkService()) {
        self.networkManager = networkManager
    }

    func fetch() {
        let request = NetworkRequest(path: MovieType.popular.path, method: .get, headers: ["Content-Type" : "application/json"])
        networkManager.request(request) { [weak self] (_ result: Result<PopularResult, ErrorResponse>) in
            switch result {
            case .success(let popularResult):
                self?.popular = popularResult.results
            case .failure(let error):
                print(error)
            }
        }
    }
}
