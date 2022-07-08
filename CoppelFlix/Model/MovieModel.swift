//
//  MovieService.swift
//  CoppelFlix

import Foundation
class MovieModel: Codable {
    let page: Int
    let results: [ResultMovie]
    let totalPages, totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    init(page: Int, results: [ResultMovie], totalPages: Int, totalResults: Int) {
        self.page = page
        self.results = results
        self.totalPages = totalPages
        self.totalResults = totalResults
    }
}

class ResultMovie: Codable {
    var adult: Bool = false
    var backdropPath: String = ""
    var genreIDS: [Int] = []
    var id: Int = 0
    var originalLanguage: OriginalLanguage?
    var originalTitle: String = ""
    var overview: String = ""
    var popularity: Double = 0.0
    var posterPath : String = ""
    var releaseDate: String = ""
    var title: String = ""
    var video: Bool = false
    var voteAverage: Double = 0.0
    var voteCount: Int = 0
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    init(){}
    
    init(adult: Bool, backdropPath: String, genreIDS: [Int], id: Int, originalLanguage: OriginalLanguage, originalTitle: String, overview: String, popularity: Double, posterPath: String, releaseDate: String, title: String, video: Bool, voteAverage: Double, voteCount: Int) {
        self.adult = adult
        self.backdropPath = backdropPath
        self.genreIDS = genreIDS
        self.id = id
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.overview = overview
        self.popularity = popularity
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.title = title
        self.video = video
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case es = "es"
}

