//
//  MoviesEntityManager.swift
//  CoppelFlix
//
//  Created by BRM16031 on 07/07/22.
//

import Foundation
import UIKit
class MovieEntityManager {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func getAll() -> [MoviesFav]{
        var movies = [MoviesFav]()
        do{
            movies = try context.fetch(MoviesFav.fetchRequest())
        }catch{}
        return movies

    }
    func deleteMovie(movie: MoviesFav){
        context.delete(movie)
    }
    
    func setMovie(movie:ResultMovie){
        let movieContext = MoviesFav(context: context)
        movieContext.title = movie.title
        movieContext.overview = movie.overview
        movieContext.posterPath = movie.posterPath
        movieContext.releaseDate = movie.releaseDate
        movieContext.voteAverage = movie.voteAverage
        movieContext.idMovie = movie.id.description
        do {
            try context.save()
        }catch{}
    }
}
