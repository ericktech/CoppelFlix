//
//  MoviesFav+CoreDataProperties.swift
//  CoppelFlix
//
//  Created by BRM16031 on 08/07/22.
//
//

import Foundation
import CoreData


extension MoviesFav {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MoviesFav> {
        return NSFetchRequest<MoviesFav>(entityName: "MoviesFav")
    }

    @NSManaged public var overview: String?
    @NSManaged public var posterPath: String?
    @NSManaged public var releaseDate: String?
    @NSManaged public var title: String?
    @NSManaged public var voteAverage: Double
    @NSManaged public var idMovie: String?

}

extension MoviesFav : Identifiable {

}
