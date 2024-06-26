//
//  Pokemon.swift
//  Domain
//
//  Created by Christos Kaktsis on 25/6/24.
//

import Foundation

struct Pokemon {
    var id: UUID = .init()
    let name: String
    let url: String
    
    var imageUrl: String {
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(url.split(separator: "/").last ?? "1").png"
        
    }
}

struct PokemonResponse: Decodable {
    let count: Int?
    let results: [PokemonEntryResponse]?
}

struct PokemonEntryResponse: Decodable {
    let name: String?
    let url: String?
}
