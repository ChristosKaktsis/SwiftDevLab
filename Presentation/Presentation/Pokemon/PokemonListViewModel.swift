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
    case goBack
}

class PokemonListViewModel: BaseViewModel, ObservableObject {
    
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
        case .goBack:
            actionHandler?.handleAction(action: .stop)
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
                    await MainActor.run {
                        self.pokemons += pokemons
                        self.offset += self.limit
                    }
                case .failure(let failure):
                    self.errorMessage = failure.localizedDescription
                }
            } catch {
                print(error)
            }
        }
    }
}

@Observable
class PokemonListSwiftUIViewModel {
    private weak var actionHandler: BaseActionHandler?
    var getPokemonsUseCase: GetPokemonsUseCase = InjectedValues[\.pokemonDataContext]
    var isLoading: Bool = false
    var pokemons: [Pokemon] = []
    var errorMessage: String = ""
    var offset: Int = 0
    var limit = 20
    
    init(actionHandler: BaseActionHandler? = nil) {
        self.actionHandler = actionHandler
    }
    
    func onTriggeredEvent(event: PokemonEvents) {
        switch event {
        case .fetchData:
            getPokemons(offset: offset, limit: limit)
        case .goBack:
            actionHandler?.handleAction(action: .stop)
        }
    }
    
    func getPokemons(offset: Int, limit: Int) {
        guard !isLoading else { return }
        isLoading = true
        Task {
            do {
                let result = try await self.getPokemonsUseCase.execute(offset: offset, limit: limit)
                self.isLoading = false
                switch result {
                case .success(let pokemons):
                    await MainActor.run {
                        self.pokemons += pokemons
                        self.offset += self.limit
                    }
                    
                case .failure(let failure):
                    self.errorMessage = failure.localizedDescription
                }
            } catch {
                print(error)
            }
        }
    }
}
