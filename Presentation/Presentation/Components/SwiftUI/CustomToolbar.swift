//
//  CustomToolbar.swift
//  Presentation
//
//  Created by Christos Kaktsis on 30/8/24.
//

import SwiftUI

struct CustomToolbar: View {
    var body: some View {
        HStack(alignment: .center) {
            Button(action: {
                print("Custom back button pressed!")
            }) {
                HStack {
                    Image(systemName: "chevron.left")
                        .foregroundColor(ColorPalette.DarkGray.value.swiftUIColor)
                    Text("Back")
                        .foregroundStyle(ColorPalette.DarkGray.value.swiftUIColor)
                }
            }
            .padding(.trailing, 24)
            Text("Header Title")
                .font(.title)
                .foregroundStyle(ColorPalette.DarkGray.value.swiftUIColor)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    CustomToolbar()
}
