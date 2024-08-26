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
    
    public var imageUrl: String {
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png"
        
    }
    
    public init(id: Int, name: String, url: String, types: [PokemonType]) {
        self.id = id
        self.name = name
        self.url = url
        self.types = types
    }
}
