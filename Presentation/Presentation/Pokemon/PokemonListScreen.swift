//
//  PokemonListScreen.swift
//  Presentation
//
//  Created by Christos Kaktsis on 19/8/24.
//

import SwiftUI
import Domain

struct PokemonListScreen: View {
    @State private var viewModel = ViewModel()
    let columns = [
        GridItem(.flexible()), // First column
        GridItem(.flexible()), // Second column
    ]
    var body: some View {
        ZStack {
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(2.5)
                    .padding()
            }
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    let pokemons = viewModel.pokemons
                    ForEach(pokemons, id: \.id) { pokemon in
                        PokemonView(pokemon: pokemon)
                    }
                }
                .padding()
            }
        }
        .onAppear {
            viewModel.getPokemons(offset: 0, limit: 10)
        }
    }
}

extension PokemonListScreen {
    @Observable
    class ViewModel {
        var getPokemonsUseCase: GetPokemonsUseCase = InjectedValues[\.pokemonDataContext]
        var isLoading: Bool = false
        var pokemons: [Pokemon] = []
        var errorMessage: String = ""
        
        func getPokemons(offset: Int, limit: Int) {
            isLoading = true
            Task {
                do {
                    let result = try await self.getPokemonsUseCase.execute(offset: offset, limit: limit)
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
}

#Preview {
    PokemonListScreen()
}
