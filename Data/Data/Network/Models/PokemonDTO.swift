//
//  PokemonDTO.swift
//  Data
//
//  Created by Christos Kaktsis on 31/7/24.
//

import Foundation

public struct PokemonResponse: Decodable {
    let count: Int?
    let results: [PokemonEntryResponse]?
}

struct PokemonEntryResponse: Decodable {
    let name: String?
    let url: String?
}
