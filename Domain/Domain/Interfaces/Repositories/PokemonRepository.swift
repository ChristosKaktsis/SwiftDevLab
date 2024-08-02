//
//  PokemonRepositoryImpl.swift
//  Domain
//
//  Created by Christos Kaktsis on 25/6/24.
//

import Foundation

public protocol PokemonRepositoryProtocol{
    func getPokemons(offset: Int, limit: Int) async throws -> [Pokemon]
}
