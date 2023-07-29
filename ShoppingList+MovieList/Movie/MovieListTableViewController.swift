//
//  MovieListTableViewController.swift
//  ShoppingList+MovieList
//
//  Created by 정준영 on 2023/07/30.
//

import UIKit

final class MovieListTableViewController: UITableViewController {
    
    private var movieList: [Movie]!
    override func viewDidLoad() {
        super.viewDidLoad()
        movieList = MovieInfo().movie
    }

    // MARK: - Table view data source
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return movieList.count
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: MovieListTableViewCell.identifier
        ) as! MovieListTableViewCell
        cell.movie = movieList[indexPath.row]
        return cell
    }
}
