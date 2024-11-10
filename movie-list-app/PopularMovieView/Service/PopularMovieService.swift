//
//  PopularMovieService.swift
//  movie-list-app
//
//  Created by Mehta, Utkarsh on 10/11/24.
//

import Foundation

class PopularMovieService {
    private let apiKey = "e4c3b4db3a7ecaab975615661a4792bc"
    private let baseURL = "https://api.themoviedb.org/3"
    
    func fatchPopularMovies(
        completion: @escaping (
            Result<[PopularMovie], NetworkError>) -> Void) {
                guard var urlComponents = URLComponents(string: "\(baseURL)/movie/popular") else {
                    completion(.failure(.invalidURL))
                    return
                }
                
                urlComponents.queryItems = [
                    URLQueryItem(name: "api_key", value: apiKey),
                    URLQueryItem(name: "language", value: "en-US"),
                    URLQueryItem(name: "api_key", value: "1")
                ]
                guard let url = urlComponents.url else {
                    completion(.failure(.invalidURL))
                    return
                }
                
                NetworkManager.shared
                    .performRequest(
                        with: url
                    ) { (result: Result<PopularMovieResponse, NetworkError>) in
                        switch result {
                        case .success(let movieResponse):
                            completion(.success(movieResponse.results))
                        case .failure(let error):
                            completion(.failure(error))
                        }
                    }
            }
}
