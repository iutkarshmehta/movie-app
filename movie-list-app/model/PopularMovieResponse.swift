//
//  PopularMovie.swift
//  movie-list-app
//
//  Created by Mehta, Utkarsh on 29/10/24.
//

import Foundation

struct PopularMovieResponse : Codable{
    var page : Int
    var results : [PopularMovie]
    var total_pages : Int
    var total_results : Int
}

struct PopularMovie : Codable{
    var original_title : String
    var overview : String
    var vote_average : Double
    var poster_path : String
    var release_date : String
}

