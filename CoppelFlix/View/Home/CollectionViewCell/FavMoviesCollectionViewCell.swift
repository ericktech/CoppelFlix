//
//  FavMoviesCollectionViewCell.swift
//  CoppelFlix


import UIKit

class FavMoviesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblRank: UILabel!
    @IBOutlet weak var lblDescrp: UILabel!
    
    
    private let presenter = MoviesCollectionViewPresenter()
    
    private let imagePath = "https://image.tmdb.org/t/p/w500"
    private var resultMovFav = MoviesFav()
    
    func configFavs(with movie: MoviesFav){
        self.resultMovFav = movie
        lblTitle.text = movie.title
        lblDate.text = movie.releaseDate
        lblRank.text = movie.voteAverage.description
        lblDescrp.text = movie.overview
        imgView.loadFrom(URLAddress: "\(imagePath)\(movie.posterPath ?? "")")
    }
    
    
}

