//
//  PopularListViewController.swift
//  Movies
//
//  Created by Samuel Nascimento de Jesus on 26/12/22.
//

import UIKit
import SwiftUI

class PopularListViewController: UITableViewController {

    // MARK: - private variables
    private let popularViewModel = PopularViewModel()

    // MARK: - viewDidLoad method
    override func viewDidLoad() {
        super.viewDidLoad()
        popularViewModel.delegate = self
        popularViewModel.fetch()
        viewConfiguration()
    }

    // MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return popularViewModel.popularList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()

        let cellItem = popularViewModel.cellItem(for: indexPath)

        content.text = "\(cellItem.title)"
        cell.contentConfiguration = content

        return cell
    }

    //MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        popularViewModel.didSelectItem(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }

    //MARK: - private methods
    private func viewConfiguration() {
        self.title = "Popular"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}

// MARK: - popularViewModel delegate methods
extension PopularListViewController: PopularViewModelDelegate {
    func didUpdatePopularMovies() {
        tableView.reloadData()
    }

    func presentPopularMovieDetail() {
        let movieController = MovieDetailViewController()

        navigationController?.pushViewController(movieController, animated: true)
    }
}

// MARK: - controllerRepresentable UIKit to SwiftUI
struct PopularListFlow: UIViewControllerRepresentable {
    typealias UIViewControllerType = UINavigationController

    func makeUIViewController(context: Context) -> UIViewControllerType {
        let popularListVC = PopularListViewController()

        return UINavigationController(rootViewController: popularListVC)
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

    }
}
