//
//  ProfileViewControllerPresenter.swift
//  CoppelFlix
//
//  Created by BRM16031 on 07/07/22.
//

import Foundation

class ProfileViewPresenter {
    private let moviesService : MovieService
    weak private var profileViewDelegate : ProfileViewDelegate?
    
    init (movieService: MovieService){
        self.moviesService = movieService
    }
    func setViewDelegate(delegate: ProfileViewDelegate){
        self.profileViewDelegate = delegate
    }
    
    
    func getFavMovies(){
        self.moviesService.getFavMovies(completion: {[weak self] result in
            self?.profileViewDelegate?.FavMovies(movies: result)
        })
    }
    func getMovieDetail(movieId:String){
        self.moviesService.getMovie(movieId: movieId, completion: {[weak self] result in
            switch result{
            case .success(let movie) :
                return
            case .failure(let error ):
                return
            }
            
        })
    }
}
