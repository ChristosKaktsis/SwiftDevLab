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
            var detailedPokemons: [PokemonEntryResponse] = []
//            for item in data.results ?? [] {
//                let details = try await remote.getPokemon(url: item.url ?? "")
//                detailedPokemons.append(details)
//            }
            
            try await withThrowingTaskGroup(of: PokemonEntryResponse.self) { group in
                let counter = Counter() // Create a counter object.
                for result in data.results ?? [] {
                    group.addTask {
                        // Work inside this closure is captured as a task.
                        // The code should return a PokemonEntryResponse.
                        let pokemon = try await self.remote.getPokemon(url: result.url ?? "")
                        await counter.increment()
                        return pokemon
                    }
                }
                // Wait on a result with group.next().
                while let pokemon = try await group.next() {
                    detailedPokemons.append(pokemon)
                }
            }
            
            return PokemonMapper.mapPokemonsResponseToDomain(input: detailedPokemons)
        } catch {
            throw error
        }
    }
}
