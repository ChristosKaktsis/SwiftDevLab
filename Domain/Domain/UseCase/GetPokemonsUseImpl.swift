//
//  GetPokemonsUseImpl.swift
//  Domain
//
//  Created by Christos Kaktsis on 25/6/24.
//

import Foundation

protocol GetPokemonsUseCase {
    func execute(offset: Int, limit: Int) async throws -> Result<[Pokemon], Error>
}

struct GetPokemonsUseImpl: GetPokemonsUseCase{
     let repo: PokemonRepositoryProtocol
    
    func execute(offset: Int, limit: Int) async throws -> Result<[Pokemon], Error> {
        do {
            let pokemons = try await repo.getPokemons(offset: offset, limit: limit)
            return .success(pokemons)
        } catch {
            return .failure(error)
        }
    }
}
