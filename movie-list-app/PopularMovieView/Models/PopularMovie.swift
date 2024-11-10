//
//  PopularMovie.swift
//  movie-list-app
//
//  Created by Mehta, Utkarsh on 30/10/24.
//

import Foundation

struct PopularMovie: Codable, Hashable {
    var originalTitle: String
    var overview: String
    var voteAverage: Double
    var posterPath: String?
    var releaseDate: String
    var backDropPath: String?
    var id: Int
    
    enum CodingKeys: String, CodingKey {
         case overview, id
         case originalTitle = "original_title"
         case voteAverage = "vote_average"
         case posterPath = "poster_path"
         case releaseDate = "release_date"
         case backDropPath = "backdrop_path"
    }
    
    var posterURL: URL? {
        guard let path = posterPath else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w500\(path)")
    }
    
    var backDropURL: URL? {
        guard let path = backDropPath else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w500\(path)")
    }
}
