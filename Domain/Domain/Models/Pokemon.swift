//
//  Pokemon.swift
//  Domain
//
//  Created by Christos Kaktsis on 25/6/24.
//

import Foundation

public struct Pokemon {
    public var id: Int = .init()
    public let name: String
    public let url: String
    public let types: [PokemonType]
    public let abilities: [Ability]
    public let description: String
    public let weight: String
    public let height: String
    
    public var imageUrl: String {
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png"
    }
    
    public init(
        id: Int,
        name: String,
        url: String,
        types: [PokemonType],
        abilities: [Ability],
        description: String,
        weight: String,
        height: String
    ) {
        self.id = id
        self.name = name
        self.url = url
        self.types = types
        self.abilities = abilities
        self.description = description
        self.weight = weight
        self.height = height
    }
}
