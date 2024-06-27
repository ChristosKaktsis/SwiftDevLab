//
//  PokemonViewModel.swift
//  SwiftDevLab
//
//  Created by Christos Kaktsis on 21/6/24.
//

import Foundation
import Domain

enum PokemonEvents {
    case fetchData
}

class PokemonListViewModel: BaseViewModel {
    let getPokemonsUseCase: GetPokemonsUseCase
    private weak var actionHandler: BaseActionHandler?
    typealias Event = PokemonEvents
    
    var isLoading: Bool
    var pokemons: [Pokemon]
    var errorMessage: String
    
    init(actionHandler: BaseActionHandler? = nil) {
        self.actionHandler = actionHandler
        self.isLoading = false
        self.pokemons = []
        self.errorMessage = ""
        self.getPokemonsUseCase = GetPokemonsUseImpl()
    }
    
    func onTriggeredEvent(event: Event) {
        switch event {
        case .fetchData:
            Task {
                do {
                    try await getPokemons(offset: 0, limit: 10)
                } catch {
                    print(error)
                }
            }
        }
    }
    
    func getPokemons(offset: Int, limit: Int) async throws {
        isLoading = true
        let result = try await getPokemonsUseCase.execute(offset: offset, limit: limit)
        switch result {
        case .success(let pokemons):
            self.pokemons = pokemons
            self.isLoading = false
            for pokemon in pokemons { 
                print(pokemon)
            }
        case .failure(let failure):
            self.isLoading = false
            self.errorMessage = failure.localizedDescription
        }
    }
}

