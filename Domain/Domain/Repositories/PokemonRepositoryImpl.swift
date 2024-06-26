//
//  PokemonRepositoryImpl.swift
//  Domain
//
//  Created by Christos Kaktsis on 25/6/24.
//

import Foundation

protocol PokemonRepositoryProtocol{
    func getPokemons(offset: Int, limit: Int) async throws -> [Pokemon]
}

enum PokemonMapper {
    static func mapPokemonsResponseToDomain(input response: [PokemonEntryResponse]) -> [Pokemon] {
        return response.map { result in
            return Pokemon(
                name: result.name ?? "Unknown",
                url: result.url ?? "Unknown"
            )
        }
    }
}

struct PokemonRepositoryImpl {
    typealias PokemonInstance = (RemoteDataSource) -> PokemonRepositoryImpl
    
    fileprivate let remote: RemoteDataSource
    
    private init(remote: RemoteDataSource) {
        self.remote = remote
    }
    
    static let sharedInstance: PokemonInstance = {  remoteRepo in
        return PokemonRepositoryImpl(remote: remoteRepo)
    }
}

extension PokemonRepositoryImpl: PokemonRepositoryProtocol {
    
    func getPokemons(offset: Int, limit: Int) async throws -> [Pokemon] {
        do {
            let data = try await remote.getPokemons(offset: offset, limit: limit)
            
            return PokemonMapper.mapPokemonsResponseToDomain(input: data.results ?? [])
        } catch {
            throw error
        }
    }
}
