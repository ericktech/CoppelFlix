//
//  HomeViewPresenter.swift
//  CoppelFlix
//

import Foundation
import UIKit
class HomeViewPresenter {
    private let moviesService : MovieService
    weak private var homeVieweDelegate : HomeViewDelegate?
    
    init (movieService: MovieService){
        self.moviesService = movieService
    }
    func setViewDelegate(delegate: HomeViewDelegate){
        self.homeVieweDelegate = delegate
    }

    
    func getMovies(){
        self.moviesService.getMovies(completion: {[weak self] result in
            switch result {
            case .failure(let error) :
                print(error)
            case .success(let moviesResult) :
                self?.homeVieweDelegate?.setMovies(movies: moviesResult)
            }
        })
    }
}
