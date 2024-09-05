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
    
    private func executeGroupTasks<T>(urls: [String], fetch: @escaping (String) async throws -> T) async throws -> [T] {
        var results: [T] = []
        try await withThrowingTaskGroup(of: T.self) { group in
            for url in urls {
                group.addTask {
                    // Work inside this closure is captured as a task.
                    // The code should return a PokemonEntryResponse.
                    return try await fetch(url)
                }
            }
            // Wait on a result with group.next().
            while let result = try await group.next() {
                results.append(result)
            }
        }
        return results
    }
    
    // Generic function to sort an array by an optional comparable key
    private func sortByOptionalKey<T, Key: Comparable>(_ array: [T], key: (T) -> Key?, nilsFirst: Bool = false) -> [T] {
        return array.sorted {
            switch (key($0), key($1)) {
            case let (key1?, key2?): // Both keys are non-nil
                return key1 < key2
            case (nil, nil): // Both keys are nil
                return false
            case (nil, _): // First key is nil
                return nilsFirst
            case (_, nil): // Second key is nil
                return !nilsFirst
            }
        }
    }
    
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
