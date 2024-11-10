//
//  PopularMovieVM.swift
//  movie-list-app
//
//  Created by Mehta, Utkarsh on 10/11/24.
//

import Foundation

@MainActor
class PopularMovieVM: ObservableObject {
    @Published var popularMovies: [PopularMovie] = []
    @Published var error: String?
    @Published var isLoading = false
    
    private var movieService = PopularMovieService()
    
    func loadPopularMovies() async {
        self.isLoading = true
        movieService.fatchPopularMovies { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let movies):
                    self?.isLoading = false
                    self?.popularMovies = movies
                case .failure(let error):
                    self?.isLoading = false
                    self?.error = self?.handleError(error)
                }
            }
        }
    }
    
    private func handleError(_ error: NetworkError) -> String {
        switch error {
        case .invalidURL:
            return "Invalid URL"
        case .requestFailed(let error):
            return "Request failed: \(error.localizedDescription)"
        case .invalidResponse:
            return "Invalid response"
        case .decodingFailed:
            return "Decoding failed"
        }
    }
}
