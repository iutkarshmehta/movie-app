//
//  PopularMovieVM.swift
//  movie-list-app
//
//  Created by Mehta, Utkarsh on 10/11/24.
//

import Foundation

class PopularMovieViewModel: ObservableObject {
    @Published var popularMovies: [PopularMovie] = []
    @Published var error: String?
    @Published var isLoading = false
    
    private var movieService: MovieServiceProtocol
    
    init(movieService: MovieServiceProtocol) {
        self.movieService = movieService
    }
    
    @MainActor
    func loadPopularMovies() async {
        let result = await movieService.fetchPopularMovies(page: 2)
        switch result {
        case .success(let movies):
            self.popularMovies = movies.results
            print(self.popularMovies)
        case .failure(let error):
            self.error = error.localizedDescription
        }
    }
}

// actors and main actors
