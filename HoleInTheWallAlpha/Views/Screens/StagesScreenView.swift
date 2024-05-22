//
//  StagesScreenView.swift
//  HoleInTheWallAlpha
//
//  Created by Reyhan Ariq Syahalam on 20/05/24.
//

import SwiftUI

struct StagesScreenView: View {
    var body: some View {
        ZStack(alignment: .center) {
            Group{ // Background
                Image("bgStage")
                    .ignoresSafeArea()
                VStack(alignment: .center) {
                    CameraView()
                        .frame(width: 688, height: 718)
                        .offset(CGSize(width: 10, height: 76.0))
                }
                Image("stageWall-1")
                
            }
            VStack {
                
            }
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    VStack {
                        Text("SCORE")
                            .font(Font.custom("SF Mono", size: 16))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                        Text("1000")
                            .font(
                                Font.custom("SF Mono", size: 24)
                                    .weight(.bold)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                    }
                    Spacer()
                    VStack {
                        Text("SCORE")
                            .font(
                            Font.custom("SF Mono", size: 24)
                            .weight(.semibold)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                        Text("10")
                            .font(
                            Font.custom("SF Mono", size: 48)
                            .weight(.bold)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                    }
                    Spacer()
                    VStack {
                        Text("LEVEL")
                            .font(Font.custom("SF Mono", size: 16))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                        Text("EASY")
                            .font(
                                Font.custom("SF Mono", size: 24)
                                    .weight(.bold)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
                Spacer()
                
            }
            .padding(.top, 28.0)
            .frame(width: 1728, height: 1117)
        }
        .ignoresSafeArea()
        
    }
}

#Preview {
    StagesScreenView()
}
