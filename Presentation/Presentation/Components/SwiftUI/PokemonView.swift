//
//  PokemonView.swift
//  Presentation
//
//  Created by Christos Kaktsis on 22/8/24.
//

import SwiftUI

struct PokemonView: View {
    let name: String
    var body: some View {
        VStack(alignment: .leading) {
            PokemonImage()
                .clipShape(.rect(cornerRadius: 5.0))
            Text("#0001")
                .foregroundStyle(ColorPalette.DarkGray.value.swiftUIColor)
                .font(.system(size: 10))
                .padding(.bottom, 8)
            Text(name).font(.system(size: 12))
            HStack{
                PokemonTypeView()
                PokemonTypeView()
            }
        }
        .padding()
    }
}

struct PokemonImage: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(ColorPalette.LightGray.value.swiftUIColor)
            Image(systemName: "fish")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(16)
        }
    }
}

struct PokemonTypeView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(ColorPalette.Red.value.swiftUIColor)
            Text("TYPE")
                .foregroundStyle(ColorPalette.White.value.swiftUIColor)
                .font(.system(size: 10))
        }
        .frame(height: 16)
        .cornerRadius(5.0)
    }
}

#Preview {
    PokemonView(name: "NAME")
}
