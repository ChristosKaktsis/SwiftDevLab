//
//  InjectDataContexts.swift
//  Presentation
//
//  Created by Christos Kaktsis on 2/8/24.
//

import Foundation
import Domain
import Data

private struct PokemonDataContextProvider: InjectionKey {
    static var currentValue: GetPokemonsUseCase = GetPokemonsUseImpl(repo: PokemonRepositoryImpl())
}

extension InjectedValues {
    
    public var pokemonDataContext: GetPokemonsUseCase {
        get { Self[PokemonDataContextProvider.self] }
        set { Self[PokemonDataContextProvider.self] = newValue }
    }
}
