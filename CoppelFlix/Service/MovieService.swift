//
//  MovieService.swift
//  CoppelFlix
//
//  Created by BRM16031 on 07/07/22.
//

import Foundation

class MovieService{
    let apiKey = "?api_key=8c35a385443d1a90b966ca11d6d7fb96"
    let apiUlrBase = "https://api.themoviedb.org/3/discover/movie"
    let apiUrlBaseDetail = "https://api.themoviedb.org/3/movie/"
    func getMovies (completion: @escaping(Result<[ResultMovie], MoviesError>) -> Void){
        
        let urlSessionConfiguration = URLSessionConfiguration.default
        let urlSession = URLSession(configuration: urlSessionConfiguration)
        
        let url = URL(string: apiUlrBase + apiKey)
        
        let urlRequest = URLRequest(url: url!)
        
        urlSession.dataTask(with: urlRequest) { data, response, error in
            print("Data \(String(describing: data))")
            print("Response \(String(describing: response))")
            print("Error \(String(describing: error))")
            
            let jsonDecoder = JSONDecoder()
            let responseModel = try? jsonDecoder.decode(MovieModel.self, from: data!)
            
            let resultMovie = responseModel?.results
            completion(.success(resultMovie!))
            
            
        }.resume()
        
    }

    func getMovie(movieId:String, completion : @escaping(Result<MovieDetailModel, MoviesError>) -> Void){
        let urlSessionConfiguration = URLSessionConfiguration.default
        let urlSession = URLSession(configuration: urlSessionConfiguration)
        let url = URL(string: apiUrlBaseDetail + "/" + movieId + apiKey)
        let urlRequest = URLRequest(url: url!)
        urlSession.dataTask(with: urlRequest) { data, response, error in
            print("Data \(String(describing: data))")
            print("Response \(String(describing: response))")
            print("Error \(String(describing: error))")
            
            let jsonDecoder = JSONDecoder()
            let responseModel = try? jsonDecoder.decode(MovieDetailModel.self, from: data!)
            
            let resultMovie = responseModel
            completion(.success(resultMovie!))
            
            
        }.resume()
        
    }
    
    
    
    func getFavMovies(completion: @escaping([MoviesFav]) -> Void){
        let mContext = MovieEntityManager()
        let movies = mContext.getAll()
        completion(movies)
    }
}

enum MoviesError:Error {
    case noData
    case canNotProcessData
}
