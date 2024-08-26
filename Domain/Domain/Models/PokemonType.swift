//
//  PokemonType.swift
//  Domain
//
//  Created by Christos Kaktsis on 26/8/24.
//

import Foundation

public struct PokemonType: Decodable {
    public let name: String
    
    public init(name: String) {
        self.name = name
    }
}
