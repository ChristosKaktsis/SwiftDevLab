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
            
            return PokemonMapper.mapPokemonsResponseToDomain(input: data.results ?? [])
        } catch {
            throw error
        }
    }
}
