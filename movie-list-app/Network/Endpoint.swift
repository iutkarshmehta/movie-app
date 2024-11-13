//
//  Endpoints.swift
//  movie-list-app
//
//  Created by Mehta, Utkarsh on 13/11/24.
//

import Foundation

protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var method: String { get }
    var headers: [String: String]? { get }
    var queryItems: [String: String] { get }
}

extension Endpoint {
    var url: URL? {
        var components = URLComponents(string: baseURL)
        components?.path = path
        components?.queryItems = queryItems.map { URLQueryItem(name: $0.key, value: $0.value) }
        return components?.url
    }
}

enum MovieEndpoint: Endpoint {
    case popularMovies(page: Int)
    
    var baseURL: String {
        return "https://api.themoviedb.org"
    }
    
    var path: String {
        switch self {
        case .popularMovies:
            return "/3/movie/popular"
        }
    }
    
    var method: String {
        return "GET"
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
    
    var queryItems: [String: String] {
        let apiKey = "e4c3b4db3a7ecaab975615661a4792bc"
        switch self {
        case .popularMovies(let page):
            return ["api_key": apiKey, "page": "\(page)"]
        }
    }
}
