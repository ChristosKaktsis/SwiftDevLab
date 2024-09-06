//
//  PokemonRepositoryImpl.swift
//  Data
//
//  Created by Christos Kaktsis on 31/7/24.
//

import Foundation
import Domain

public class PokemonRepositoryImpl {
    
    public let remote: RemoteDataSoureProtocol = InjectedValues[\.remoteDataSourceProvider]
    
    public init() {}
    
    
}

extension PokemonRepositoryImpl: PokemonRepositoryProtocol {
    public func getPokemons(offset: Int, limit: Int) async throws -> [Pokemon] {
        do {
            let data = try await remote.getPokemons(offset: offset, limit: limit)
            let urls = data.results?.compactMap { $0.url } ?? []
            let detailedPokemons: [PokemonEntryResponse] = try await executeGroupTasks(urls: urls) { url in
                return try await self.remote.getPokemon(url: url)
            }
            // Sort Pokémon entries using the generic sorting function
            let sortedPokemonEntries = sortByOptionalKey(detailedPokemons, key: { $0.id }, nilsFirst: false)
            
            return PokemonMapper.mapPokemonsResponseToDomain(input: sortedPokemonEntries)
            
        } catch {
            throw error
        }
    }
}
