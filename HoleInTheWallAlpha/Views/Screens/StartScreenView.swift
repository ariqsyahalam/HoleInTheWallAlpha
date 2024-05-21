//
//  StartScreenView.swift
//  HoleInTheWallAlpha
//
//  Created by Reyhan Ariq Syahalam on 20/05/24.
//

import SwiftUI

struct StartScreenView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Group{ // Background
                    Image("bgBrickWall")
                    Image("bgStoneWall")
                }
                VStack {
                    VStack (spacing:0){ // Title
                        Text("HOLE")
                            .font(
                                Font.custom("Enriqueta", size: 256)
                                    .weight(.bold)
                            )
                            .kerning(35.84)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                        Text("IN THE WALL")
                            .font(
                                Font.custom("Enriqueta", size: 128)
                                    .weight(.bold)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                    }
                    
                    VStack(spacing:12) {
                        NavigationLink(destination: StagesScreenView()) {
                            Text("RESUME")
                                .aText(.button)
                        }.aButton(.primary)
                        
                        NavigationLink(destination: StagesScreenView()) {
                            Text("RESUME")
                                .aText(.button)
                        }.aButton(.primary)
                        
                        NavigationLink(destination: StagesScreenView()) {
                            Text("RESUME")
                                .aText(.button)
                        }.aButton(.primary)
                        
                    }
                    
                }
                //                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .navigationTitle("Start Screen")
            }
        }
        
    }
}

#Preview {
    StartScreenView()
}
