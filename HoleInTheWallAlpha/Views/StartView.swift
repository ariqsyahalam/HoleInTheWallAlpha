//
//  StartScreenView.swift
//  HoleInTheWallAlpha
//
//  Created by Reyhan Ariq Syahalam on 20/05/24.
//

import SwiftUI

struct StartView: View {
    let musicPlayer = MusicPlayer()
    
    var body: some View {
        NavigationStack{
            ZStack {
                // Background
                Group {
                    Image("homebg")
                        .ignoresSafeArea()
                }
                
                // Foreground
                Group {
                    VStack {
                        VStack(spacing: -36) {
                            Text("HOLE")
                                .aText(.title)
                            Text("IN THE")
                                .font(
                                    Font.custom("SF Mono", size: 96)
                                        .weight(.light)
                                )
                                .kerning(27.84)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                            Text("WALL")
                                .font(
                                    Font.custom("SF Mono", size: 200)
                                        .weight(.bold)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                        }
                        .padding(.bottom, 8)
                        .onDisappear{
                            musicPlayer.audioPlayer?.stop()
                        }
                        NavigationLink(destination: StagesView()) {
                            Text("START")
                                .font(
                                    Font.custom("SF Mono", size: 32)
                                        .weight(.bold)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)
                                .gesture(TapGesture().onEnded({
                                    print("tapped")
                                    musicPlayer.audioPlayer?.stop()
                                }))
                        }
                        
                        .padding(.horizontal, 32)
                        .padding(.vertical, 16)
                        .frame(width: 496, alignment: .center)
                        .background(Color(red: 0.91, green: 0.67, blue: 0.19))
                        .shadow(color: Color(red: 0.72, green: 0.69, blue: 0.69), radius: 0, x: 8, y: 8)
                    }
                    .padding(.bottom, 240)
                }
            }
        }
        .onAppear {
            musicPlayer.playBackgroundMusic(musicName: "gameplay", extensionType: "mp3")
        }
        .ignoresSafeArea()
    }
}

#Preview {
    StartView()
}
