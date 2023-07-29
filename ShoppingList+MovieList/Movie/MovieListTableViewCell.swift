//
//  MovieListTableViewCell.swift
//  ShoppingList+MovieList
//
//  Created by 정준영 on 2023/07/30.
//

import UIKit

final class MovieListTableViewCell: UITableViewCell {
    static let identifier = "MovieListTableViewCell"
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDetailInfo: UILabel!
    @IBOutlet weak var movieDescription: UILabel!

    public var movie: Movie? {
        didSet {
            guard let movie else {return}
            movieImageView.image = UIImage(named: "\(movie.title)") ?? UIImage(named: "default_poster")
            movieTitle.text = movie.title
            movieDetailInfo.text = "\(movie.releaseDate) | \(movie.runtime)분 | \(movie.rate)점"
            
        }
    }


}
