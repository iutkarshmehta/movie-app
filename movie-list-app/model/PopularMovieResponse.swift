//
//  PopularMovie.swift
//  movie-list-app
//
//  Created by Mehta, Utkarsh on 29/10/24.
//

import Foundation

struct PopularMovieResponse: Codable {
    var page: Int
    var results: [PopularMovie]
    var totalPages: Int
    var totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
