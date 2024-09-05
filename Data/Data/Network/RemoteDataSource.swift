//
//  RemoteDataSource.swift
//  Data
//
//  Created by Christos Kaktsis on 31/7/24.
//

import Foundation
import Domain

public protocol RemoteDataSoureProtocol{
    func getPokemons(offset: Int, limit: Int) async throws -> PokemonResponse
    func getPokemon(url: String) async throws -> PokemonEntryResponse
}

actor RemoteDataSource {
    public init() {}
    private let pokemonCache: NSCache<NSString, CacheEntryObject> = NSCache()
    
    // Function to fetch data from a given URL
    func httpData(from url: URL) async throws -> Data {
        
        let session = URLSession.shared
        let (data, response) = try await session.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        return data
    }
}

extension RemoteDataSource: RemoteDataSoureProtocol{
    func getPokemon(url: String) async throws -> PokemonEntryResponse {
        guard let url = url.toUrl() else {
            throw URLError(.badURL)
        }
        
        if let cached = pokemonCache[url] {
            switch cached {
            case .ready(let pokemon):
                return pokemon
            case .inProgress(let task):
                return try await task.value
            }
        }
        
        let task = Task<PokemonEntryResponse, Error> {
            // Perform the request using async/await
            let data = try await httpData(from: url)
            // Decode the JSON data
            let decoder = JSONDecoder()
            let apiResponse = try decoder.decode(PokemonEntryResponse.self, from: data)
            return apiResponse
        }
        
        pokemonCache[url] = .inProgress(task)
        
        do {
            let apiResponse = try await task.value
            pokemonCache[url] = .ready(apiResponse)
            return apiResponse
        } catch {
            pokemonCache[url] = nil
            throw error
        }
        
    }
    
    func getPokemons(offset: Int, limit: Int) async throws -> PokemonResponse {
        let urlString = "https://pokeapi.co/api/v2/pokemon/?offset=\(offset)&limit=\(limit)"
        guard let url = urlString.toUrl() else {
            throw URLError(.badURL)
        }
        // Perform the request using async/await
        let data = try await httpData(from: url)
        // Decode the JSON data
        let decoder = JSONDecoder()
        let apiResponse = try decoder.decode(PokemonResponse.self, from: data)
        return apiResponse
    }
}


extension String {
    func toUrl() -> URL? {
        return URL(string: self)
    }
}
