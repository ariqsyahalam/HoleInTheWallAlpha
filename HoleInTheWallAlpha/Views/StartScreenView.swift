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
                        NavigationLink(destination: StagesScreenView()){
                            Text("RESUME")
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
                        
                        NavigationLink(destination: StagesScreenView()){
                            Text("NEW GAME")
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
                        
                        NavigationLink(destination: StagesScreenView()){
                            Text("EXIT")
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
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .navigationTitle("Start Screen")
            }
        }
        
    }
}

#Preview {
    StartScreenView()
}
