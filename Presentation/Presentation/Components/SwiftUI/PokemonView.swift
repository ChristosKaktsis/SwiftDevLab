//
//  PokemonView.swift
//  Presentation
//
//  Created by Christos Kaktsis on 22/8/24.
//

import SwiftUI
import Domain

struct PokemonView: View {
    let pokemon: Pokemon
    var body: some View {
        VStack(alignment: .leading) {
            PokemonImage(imageUrl: pokemon.imageUrl)
                .clipShape(.rect(cornerRadius: 5.0))
            Text(String(format: "#%04d", pokemon.id))
                .foregroundStyle(ColorPalette.DarkGray.value.swiftUIColor)
                .font(.system(size: 10))
                .padding(.bottom, 8)
            Text(pokemon.name).font(.system(size: 12))
            HStack{
                ForEach(pokemon.types, id: \.name) { item in
                    PokemonTypeView(type: item.name)
                }
            }
        }
        .padding()
    }
}

struct PokemonImage: View {
    let imageUrl: String
    var body: some View {
        ZStack {
            Rectangle()
                .fill(ColorPalette.LightGray.value.swiftUIColor)
            if let imageUrl = URL(string: imageUrl) {
                AsyncImage(url: imageUrl) { phase in
                            switch phase {
                            case .empty:
                                ProgressView() // Shows a loading spinner while the image is being loaded
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit) // Adjusts the image to fit within its container
                            case .failure:
                                Image(systemName: "exclamationmark.triangle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(.red) // Displays an error image if the loading fails
                            @unknown default:
                                EmptyView()
                            }
                        }
                    .padding(16)
            } else {
                Text("Invalid URL")
            }
            
        }
    }
}

struct PokemonTypeView: View {
    let type: String
    var body: some View {
        ZStack {
            Rectangle()
                .fill(ColorPalette.Red.value.swiftUIColor)
            Text(type)
                .foregroundStyle(ColorPalette.White.value.swiftUIColor)
                .font(.system(size: 10))
        }
        .frame(height: 16)
        .cornerRadius(5.0)
    }
}

#Preview {
    PokemonView(pokemon: Pokemon(id: 1, name: "NAME", url: "", types: [PokemonType(name: "TYPE 1")]))
}
