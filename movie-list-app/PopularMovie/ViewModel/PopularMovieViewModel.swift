//
//  PopularMovieVM.swift
//  movie-list-app
//
//  Created by Mehta, Utkarsh on 10/11/24.
//

import Foundation

@MainActor
class PopularMovieViewModel: ObservableObject {
    @Published var popularMovies: [PopularMovie] = []
    @Published var error: String?
    @Published var isLoading = false
    
    private var movieService = MovieService(networkService: NetworkService())
    
    init(movieService: MovieService) {
        self.movieService = movieService
    }
    
    func loadPopularMovies() async {
        let result = await movieService.fetchPopularMovies(page: 2)
        DispatchQueue.main.async {
            switch result {
            case .success(let movies):
                self.popularMovies = movies.results
                print(self.popularMovies)
            case .failure(let error):
                self.error = error.localizedDescription
            }
        }
    }
}
