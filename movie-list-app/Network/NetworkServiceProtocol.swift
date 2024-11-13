//
//  NetworkServiceProtocol.swift
//  movie-list-app
//
//  Created by Mehta, Utkarsh on 13/11/24.
//

import Foundation

protocol NetworkServiceProtocol {
    func performRequest<T: Decodable>(for endpoint: Endpoint, responseType: T.Type) async -> Result<T, RequestError>
}

struct NetworkService: NetworkServiceProtocol {
    func performRequest<T: Decodable>(for endPoint: Endpoint, responseType: T.Type) async -> Result<T, RequestError> {
        guard let url = endPoint.url else {
            return .failure(.invalidURL)
        }
        var request = URLRequest(url: url)
        request.httpMethod = endPoint.method
        
        do {
            let (data, response) = try await URLSession.shared.data(
                for: request
            )
            
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                return .failure(.unexpectedStatusCode)
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                return .success(decodedData)
            } catch _ {
                return .failure(.decode)
            }
        } catch {
            return .failure(.requestFailed)
        }
    }
}

enum RequestError: Error {
    case decode
    case invalidURL
    case invalidData
    case noResponse
    case unexpectedStatusCode
    case unknown
    case requestFailed
    
    var customMessage: String {
        switch self {
        case .decode:
            return "Decode error"
        case .invalidData:
            return "Invalid data"
        case .requestFailed:
            return "Request failed"
        default:
            return "Unknown error"
        }
    }
}
