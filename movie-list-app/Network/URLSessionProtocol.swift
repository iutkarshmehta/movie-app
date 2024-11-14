//
//  URLSesssionProtocol.swift
//  movie-list-app
//
//  Created by Mehta, Utkarsh on 14/11/24.
//

import Foundation

protocol URLSessionProtocol {
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol {}
