//
//  PokemonViewModel.swift
//  SwiftDevLab
//
//  Created by Christos Kaktsis on 21/6/24.
//

import Foundation
import Domain
import Combine

enum PokemonEvents {
    case fetchData
}

class PokemonListViewModel: BaseViewModel {
    
    @Injected(\.pokemonDataContext)
    var getPokemonsUseCase: GetPokemonsUseCase
    
    private weak var actionHandler: BaseActionHandler?
    typealias Event = PokemonEvents
    
    @Published var isLoading: Bool
    @Published var pokemons: [Pokemon]
    
    var offset: Int = 0
    var limit = 15
    var errorMessage: String
    
    var cancellables = Set<AnyCancellable>()
    
    init(actionHandler: BaseActionHandler? = nil) {
        self.actionHandler = actionHandler
        self.isLoading = false
        self.pokemons = []
        self.errorMessage = ""
    }
    
    func onTriggeredEvent(event: Event) {
        switch event {
        case .fetchData:
            getPokemons(offset: offset, limit: limit)
        }
    }
    
    func getPokemons(offset: Int, limit: Int) {
        guard !isLoading else { return }
        isLoading = true
        Task {
            do {
                let result = try await getPokemonsUseCase.execute(offset: offset, limit: limit)
                self.isLoading = false
                switch result {
                case .success(let pokemons):
                    self.pokemons += pokemons
                    self.offset += self.limit
                case .failure(let failure):
                    self.errorMessage = failure.localizedDescription
                }
            } catch {
                print(error)
            }
        }
    }
}

