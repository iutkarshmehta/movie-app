//
//  NetworkService.swift
//  movie-list-app
//
//  Created by Mehta, Utkarsh on 05/11/24.
//

// import Combine
// import Foundation
//
// protocol APIService {
//    func request<T: Decodable>(_ endpoint: Endpoint) -> AnyPublisher<T, Error>
// }
//
// class NetworkService: APIService {
//    func request<T: Decodable>(_ endpoint: Endpoint) -> AnyPublisher<T, Error> {
//        var request = URLRequest(url: endpoint.url)
//        request.httpMethod = endpoint.httpMethod
//        
//        if let httpBody = endpoint.httpBody {
//            request.httpBody = httpBody
//            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        }
//        
//        return URLSession.shared.dataTaskPublisher(for: request)
//            .tryMap { output in
//                guard let response = output.response as? HTTPURLResponse,
//                      (200...299).contains(response.statusCode) else {
//                    throw URLError(.badServerResponse)
//                }
//                return output.data
//            }
//            .decode(type: T.self, decoder: JSONDecoder())
//            .receive(on: DispatchQueue.main)
//            .eraseToAnyPublisher()
//    }
// }
