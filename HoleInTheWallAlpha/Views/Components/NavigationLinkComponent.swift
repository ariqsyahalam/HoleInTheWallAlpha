//
//  NavigationLinkComponent.swift
//  HoleInTheWallAlpha
//
//  Created by Reyhan Ariq Syahalam on 21/05/24.
//

import SwiftUI

struct NavigationLinkComponent<Destination: View, Label: View>: View {
    var destination: Destination
    var label: Label
    
    init(destination: Destination, @ViewBuilder label: () -> Label) {
        self.destination = destination
        self.label = label()
    }
    
    var body: some View {
        NavigationLink(destination: destination) {
            label
                .font(
                    Font.custom("Enriqueta", size: 48)
                        .weight(.bold)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.42, green: 0.29, blue: 0.29))
        }
        .padding(.horizontal, 36)
        .padding(.vertical, 10)
        .background(.white)
        .overlay(
            Rectangle()
                .inset(by: 2)
                .stroke(Color(red: 0.4, green: 0.28, blue: 0.28), lineWidth: 4)
            
        )
    }
}
#Preview {
    NavigationLinkComponent(destination: ContentView()) {
        Text("Go to Detail View")
    }
}
