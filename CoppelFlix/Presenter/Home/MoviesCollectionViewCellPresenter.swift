//
//  MoviesCollectionViewCellPresenter.swift
//  CoppelFlix

import Foundation
import SwiftUI

class MoviesCollectionViewPresenter {
    init(){

    }
    
    func setFavMovie(movie :ResultMovie){
        let mContext = MovieEntityManager()
        mContext.setMovie(movie: movie)
    }
    
    func deleteFavMovie(movie :MoviesFav){
        let mContext = MovieEntityManager()
        mContext.deleteMovie(movie: movie)
    }
}
