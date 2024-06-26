//
//  RemoteDataSource.swift
//  Domain
//
//  Created by Christos Kaktsis on 25/6/24.
//

import Foundation

protocol RemoteDataSoureProtocol{
    func getPokemons(offset: Int, limit: Int) async throws -> PokemonResponse
}

struct RemoteDataSource {
    private init() {}
    
    static let shared: RemoteDataSource = RemoteDataSource()
}

extension RemoteDataSource: RemoteDataSoureProtocol{
    
    func getPokemons(offset: Int, limit: Int) async throws -> PokemonResponse {
        // Define the URL
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=\(offset)&limit=\(limit)") else {
            throw URLError(.badURL)
        }
        
        // Create the URLSession
        let session = URLSession.shared
        
        // Perform the request using async/await
        let (data, response) = try await session.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        // Decode the JSON data
        let decoder = JSONDecoder()
        let apiResponse = try decoder.decode(PokemonResponse.self, from: data)
        return apiResponse
    }
}
