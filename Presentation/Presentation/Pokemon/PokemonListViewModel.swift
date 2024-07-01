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
    let getPokemonsUseCase: GetPokemonsUseCase
    private weak var actionHandler: BaseActionHandler?
    typealias Event = PokemonEvents
    
    @Published var isLoading: Bool
    @Published var pokemons: [Pokemon]
    var errorMessage: String
    
    var cancellables = Set<AnyCancellable>()
    
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
            getPokemons(offset: 0, limit: 10)
        }
    }
    
    func getPokemons(offset: Int, limit: Int) {
        isLoading = true
        Task {
            do {
                let result = try await getPokemonsUseCase.execute(offset: offset, limit: limit)
                self.isLoading = false
                switch result {
                case .success(let pokemons):
                    self.pokemons = pokemons
                case .failure(let failure):
                    self.errorMessage = failure.localizedDescription
                }
            } catch {
                print(error)
            }
        }
    }
}

