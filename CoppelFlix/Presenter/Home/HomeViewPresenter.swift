//
//  HomeViewPresenter.swift
//  CoppelFlix
//

import Foundation
import UIKit
class HomeViewPresenter {
    private let moviesService : MovieService
    weak private var homeVieweDelegate : HomeViewDelegate?
    private weak var toastDelegate : ViewToastDelegate?

    
    init (movieService: MovieService){
        self.moviesService = movieService
    }
    func setViewDelegate(delegate: HomeViewDelegate, toastDelegate: ViewToastDelegate){
        self.homeVieweDelegate = delegate
        self.toastDelegate = toastDelegate
    }

    
    func getMovies(){
        self.moviesService.getMovies(completion: {[weak self] result in
            switch result {
            case .failure(let error) :
                self?.toastDelegate?.showToast(msj: error.localizedDescription)
                print(error)
            case .success(let moviesResult) :
                self?.homeVieweDelegate?.setMovies(movies: moviesResult)
            }
        })
    }
}
