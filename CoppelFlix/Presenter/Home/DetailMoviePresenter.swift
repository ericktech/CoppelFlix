//
//  DetailMoviePresenter.swift
//  CoppelFlix
//


import Foundation

class DetailMoviePresenter {
    private let moviesService : MovieService
    weak private var detailViewDelegate : DetailMovieDelegate?
    
    init (movieService: MovieService){
        self.moviesService = movieService
    }
    func setViewDelegate(delegate: DetailMovieDelegate){
        self.detailViewDelegate = delegate
    }
    

    func getMovieDetail(movieId:String){
        self.moviesService.getMovie(movieId: movieId, completion: {[weak self] result in
            switch result{
            case .success(let movie) :
                self?.detailViewDelegate?.movieDetail(movie: movie)
            case .failure(let error ):
                print(error)
            }
            
        })
    }
}
