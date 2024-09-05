//
//  CustomToolbar.swift
//  Presentation
//
//  Created by Christos Kaktsis on 30/8/24.
//

import SwiftUI

struct CustomToolbar: View {
    let title: String
    let onBackAction: (() -> Void)?
    
    var body: some View {
        HStack(alignment: .center) {
            Button(action: {
                onBackAction?()
            }) {
                HStack {
                    Image(systemName: "chevron.left")
                        .foregroundColor(ColorPalette.DarkGray.value.swiftUIColor)
                }
            }
            .padding(.trailing, 16)
    
            Text(title)
                .font(.title2)
                .foregroundStyle(ColorPalette.DarkGray.value.swiftUIColor)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    CustomToolbar(title: "HER") {
        print("back action pressed")
    }
}
