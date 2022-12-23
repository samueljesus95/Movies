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
    let popularServiceProtocol: PopularServiceProtocol

    init(popularServiceProtocol: PopularServiceProtocol = PopularService()) {
        self.popularServiceProtocol = popularServiceProtocol
    }

    func fetch() {
        popularServiceProtocol.loadData { [weak self] result in
            switch result {
            case .success(let popularResult):
                self?.popular = popularResult
            case .failure(let error):
                print(error)
            }
        }
    }
}
