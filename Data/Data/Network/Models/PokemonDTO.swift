//
//  PokemonDTO.swift
//  Data
//
//  Created by Christos Kaktsis on 31/7/24.
//

import Foundation
import Domain

public struct PokemonResponse: Decodable {
    let count: Int?
    let results: [PokemonEntryResponse]?
}

public struct PokemonEntryResponse: Decodable {
    let name: String?
    let url: String?
    let id: Int?
    let types: [PokemonTypeResponse]?
}

public struct PokemonTypeResponse: Decodable {
    let type: PokemonNameType?
}

public struct PokemonNameType: Decodable {
    let name: String?
}
