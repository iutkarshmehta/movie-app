//
//  MovieViewModel.swift
//  movie-list-app
//
//  Created by Mehta, Utkarsh on 05/11/24.
//

// import Combine
// import SwiftUI
//
// class MoviesViewModel: ObservableObject {
//    @Published var movies: [PopularMovie] = []
//    @Published var errorMessage: String?
//    
//    private var cancellables = Set<AnyCancellable>()
//    private let apiService: APIService
//    
//    init(apiService: APIService = NetworkService()) {
//        self.apiService = apiService
//    }
//    
//    func fetchPopularMovies(page: Int = 1) {
//        let apiKey = "YOUR_API_KEY" // Replace with your TMDb API key
//        let endpoint = Endpoint(
//            baseURL: URL(string: "https://api.themoviedb.org/3")!,
//            path: "movie/popular",
//            queryItems: [
//                URLQueryItem(name: "api_key", value: apiKey),
//                URLQueryItem(name: "page", value: "\(page)")
//            ]
//        )
//        
//        apiService.request(endpoint)
//            .sink { completion in
//                if case .failure(let error) = completion {
//                    self.errorMessage = error.localizedDescription
//                }
//            } receiveValue: { (response: PopularMovieResponse) in
//                self.movies = response.results
//            }
//            .store(in: &cancellables)
//    }
// }
