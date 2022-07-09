//
//  MoviesCollectionViewCell.swift
//  CoppelFlix
//
//  Created by BRM16031 on 07/07/22.
//

import UIKit

class MoviesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblRank: UILabel!
    @IBOutlet weak var lblDescrp: UILabel!
    @IBOutlet weak var imgFav: UIImageView!
    
    
    
    private let presenter = MoviesCollectionViewPresenter()
    private weak var toastDelegate : ViewToastDelegate?
    
    private let imagePath = "https://image.tmdb.org/t/p/w500"
    private var resultMov = ResultMovie()
    
    func setDelegate(delegate:ViewToastDelegate){
        self.toastDelegate = delegate
    }
    
    
    func config(with movie: ResultMovie){
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imgFav.isUserInteractionEnabled = true
        imgFav.addGestureRecognizer(tapGestureRecognizer)
        self.resultMov = movie
        lblTitle.text = movie.title
        lblDate.text = movie.releaseDate
        lblRank.text = movie.voteAverage.description
        lblDescrp.text = movie.overview
        imgView.loadFrom(URLAddress: "\(imagePath)\(movie.posterPath)")
    }
    
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        self.presenter.setFavMovie(movie: self.resultMov)
        self.toastDelegate?.showToast(msj: "Añadido a favoritos")
    }
    
}

