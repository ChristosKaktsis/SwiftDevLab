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
            ZStack {
                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(2.5)
                        .padding()
                }
                List {
                    LazyVGrid(columns: columns, spacing: 10) {
                        let pokemons = viewModel.pokemons
                        ForEach(pokemons, id: \.id) { pokemon in
                            PokemonView(pokemon: pokemon)
                        }
                        
                    }
                    if !viewModel.isLoading {
                        ProgressView()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .foregroundColor(.black)
                            .foregroundColor(.red)
                            .onAppear {
                                viewModel.onTriggeredEvent(event: .fetchData)
                            }
                    }
                }
                .listStyle(.plain)
            }
        }
    }
}

#Preview {
    PokemonListScreen(viewModel: PokemonListSwiftUIViewModel())
}
