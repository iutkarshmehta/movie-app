//
//  PopularMovieViewModel.swift
//  movie-list-app
//
//  Created by Mehta, Utkarsh on 29/10/24.
//

import Foundation

class PopularMovieViewModel: ObservableObject {
    @Published var popularMovies = [PopularMovie]()
    
    private let apiKey = "e4c3b4db3a7ecaab975615661a4792bc"
    
    @MainActor
    func getMovies() async {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/upcoming?api_key=\(apiKey)&language=en-US&page=1")else {
            print("Please check the URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedMovies = try? JSONDecoder().decode(
                PopularMovieResponse.self, from: data) {
                    self.popularMovies = decodedMovies.results
//                print("The value of popular movie object is: \(self.popularMovies)")
            }
        } catch {
            print("Something went worng while calling the API")
        }
    }
}
