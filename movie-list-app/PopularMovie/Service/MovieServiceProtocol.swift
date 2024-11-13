//
//  MovieServiceProtocol.swift
//  movie-list-app
//
//  Created by Mehta, Utkarsh on 13/11/24.
//

import Foundation

protocol MovieServiceProtocol {
    func fetchPopularMovies(page: Int) async -> Result<PopularMovieResponse, RequestError>
}

struct MovieService: MovieServiceProtocol {
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetchPopularMovies(page: Int) async -> Result<PopularMovieResponse, RequestError> {
        let endpoint = MovieEndpoint.popularMovies(page: page)
        return await networkService
            .performRequest(for: endpoint, responseType: PopularMovieResponse.self)
    }
}
