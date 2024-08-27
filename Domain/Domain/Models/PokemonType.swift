//
//  PokemonType.swift
//  Domain
//
//  Created by Christos Kaktsis on 26/8/24.
//

import Foundation

public struct PokemonType {
    public let value: PokemonTypeCase
    
    public init(value: PokemonTypeCase) {
        self.value = value
    }
}

public enum PokemonTypeCase: String, CaseIterable {
    case normal
    case fire
    case water
    case grass
    case electric
    case ice
    case fighting
    case poison
    case ground
    case flying
    case psychic
    case bug
    case rock
    case ghost
    case dragon
    case dark
    case steel
    case fairy
    case stellar
    case unknown
}
