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
    
    public func toDomain() -> Pokemon {
        return Pokemon(
            id: self.id ?? Int(),
            name: self.name ?? "Unknown",
            url: self.url ?? "Unknown",
            types: self.typesToDomain(),
            abilities: self.abilitiesToDomain(),
            description: "",
            weight: convertWeight(),
            height: convertHeight()
        )
    }
    
    func typesToDomain() -> [PokemonType] {
        return self.types?.map { type in
            return type.toDomain()
        } ?? []
    }
    
    func abilitiesToDomain() -> [Ability] {
        return self.abilities?.map { ability in
            return ability.toDomain()
        } ?? []
    }
    
    func convertWeight() -> String {
        return ((weight ?? 0) / 10).description
    }
    
    func convertHeight() -> String {
        return ((height ?? 0) / 10).description
    }
}

public struct PokemonTypeResponse: Decodable {
    let type: PokemonNameType?
    
    func toDomain() -> PokemonType {
        return PokemonType(
            value: PokemonTypeCase(rawValue: self.type?.name ?? "") ?? .unknown
        )
    }
}

public struct PokemonNameType: Decodable {
    let name: String?
}

public struct AbilityResponse: Codable {
    let name: String?
    let url: String?
}

public struct PokemonAbilityResponse: Codable {
    let ability: AbilityResponse?
    enum CodingKeys: String, CodingKey {
        case ability
    }
    
    func toDomain() -> Ability {
        return Ability(name: ability?.name ?? "", url: ability?.url ?? "")
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
