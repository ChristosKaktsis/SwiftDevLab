//
//  PokemonListScreen.swift
//  Presentation
//
//  Created by Christos Kaktsis on 19/8/24.
//

import SwiftUI
import Domain

struct PokemonListScreen: View {
    @State var viewModel: PokemonListSwiftUIViewModel
//    @StateObject var viewModel: PokemonListViewModel
    let columns = [
        GridItem(.flexible()), // First column
        GridItem(.flexible()), // Second column
    ]
    var body: some View {
        VStack {
            CustomToolbar(title: "Pokemon") {
                viewModel.onTriggeredEvent(event: .goBack)
            }
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    let pokemons = viewModel.pokemons
                    ForEach(pokemons, id: \.id) { pokemon in
                        PokemonView(pokemon: pokemon)
                            .onAppear {
                                if viewModel.hasReachedEndPokemons(of: pokemon) {
                                    viewModel.onTriggeredEvent(event: .fetchData)
                                }
                            }
                    }
                }
            }
        }
        .onAppear {
            viewModel.onTriggeredEvent(event: .fetchData)
        }
    }
}

#Preview {
    PokemonListScreen(viewModel: PokemonListSwiftUIViewModel())
}
