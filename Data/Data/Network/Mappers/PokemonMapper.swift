//
//  PokemonMapper.swift
//  Data
//
//  Created by Christos Kaktsis on 31/7/24.
//

import Foundation
import Domain

enum PokemonMapper {
    static func mapPokemonsResponseToDomain(input response: [PokemonEntryResponse]) -> [Pokemon] {
        return response.map { result in
            return Pokemon(
                id: result.id ?? Int(),
                name: result.name ?? "Unknown",
                url: result.url ?? "Unknown",
                types: self.mapPokemonTypes(input: result.types ?? [])
            )
        }
    }
    
   static func mapPokemonTypes(input responseTypes: [PokemonTypeResponse]) -> [PokemonType] {
        return responseTypes.map { result in
            return PokemonType(value: PokemonTypeCase(rawValue: result.type?.name ?? "") ?? .unknown
            )
        }
    }
}
