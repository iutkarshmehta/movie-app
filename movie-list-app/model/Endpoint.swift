//
//  Endpoint.swift
//  movie-list-app
//
//  Created by Mehta, Utkarsh on 05/11/24.
//

// import Foundation
//
// struct Endpoint {
//    let baseURL: URL
//    let path: String
//    var queryItems: [URLQueryItem] = []
//    var httpMethod: String = "GET"
//    var httpBody: Data?
//    
//    init(baseURL: URL, path: String, queryItems: [URLQueryItem] = [], httpMethod: String = "GET", httpBody: Data? = nil) {
//        self.baseURL = baseURL
//        self.path = path
//        self.queryItems = queryItems
//        self.httpMethod = httpMethod
//        self.httpBody = httpBody
//    }
//    
//    var url: URL {
//        var components = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: false)!
//        components.queryItems = queryItems.isEmpty ? nil : queryItems
//        return components.url!
//    }
// }
