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
    let height: Int?
    let weight: Int?
    let abilities: [PokemonAbilityResponse]?
}

public struct PokemonTypeResponse: Decodable {
    let type: PokemonNameType?
}

public struct PokemonNameType: Decodable {
    let name: String?
}

public struct AbilityResponse: Codable {
    let name: String
    let url: String
}

public struct PokemonAbilityResponse: Codable {
    let ability: AbilityResponse
    enum CodingKeys: String, CodingKey {
        case ability
    }
}

public struct PokemonSpeciesResponse: Decodable {
    let name: String?
    let id: Int?
    let flavorTextEntries: [PokemonFlavorTextEntries]?
    public enum CodingKeys: String, CodingKey {
        case name, id
        case flavorTextEntries = "flavor_text_entries"
    }
}

public struct PokemonFlavorTextEntries: Decodable {
    let flavorText: String?
    public enum CodingKeys: String, CodingKey {
        case flavorText = "flavor_text"
    }
}
