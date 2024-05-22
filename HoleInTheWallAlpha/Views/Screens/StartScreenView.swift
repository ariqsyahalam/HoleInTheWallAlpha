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
                    Image("bgStage")
                        .ignoresSafeArea()
                }
                Group{ // Foreground
                    VStack {
                        VStack(spacing: -36) {
                            Text("HOLE")
                                .font(
                                    Font.custom("SF Mono", size: 200)
                                        .weight(.bold)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                            //                                .frame(width: 495, height: 205, alignment: .top)
                            Text("IN THE")
                                .font(
                                    Font.custom("SF Mono", size: 96)
                                        .weight(.light)
                                )
                            
                                .kerning(27.84)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                            //                                .frame(width: 496, height: 69, alignment: .top)
                            Text("WALL")
                                .font(
                                    Font.custom("SF Mono", size: 200)
                                        .weight(.bold)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                            //                                .frame(width: 495, alignment: .top)
                        }
                        .padding(.bottom, 8)
                        NavigationLink(destination: StagesScreenView()) {
                            Text("START")
                                .font(
                                Font.custom("SF Mono", size: 32)
                                .weight(.bold)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)
                        }
                        .padding(.horizontal, 32)
                        .padding(.vertical, 16)
                        .frame(width: 496, alignment: .center)
                        .background(Color(red: 0.91, green: 0.67, blue: 0.19))
                        
                        .shadow(color: Color(red: 0.72, green: 0.69, blue: 0.69), radius: 0, x: 8, y: 8)
                    }
                    .padding(.bottom, 240)
                }
                .navigationTitle("Start Screen")
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    StartScreenView()
}
