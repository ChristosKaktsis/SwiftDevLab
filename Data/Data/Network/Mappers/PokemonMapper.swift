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
            result.toDomain()
        }
    }
}
