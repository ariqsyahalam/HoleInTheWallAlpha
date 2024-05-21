//
//  StagesScreenView.swift
//  HoleInTheWallAlpha
//
//  Created by Reyhan Ariq Syahalam on 20/05/24.
//

import SwiftUI

struct StagesScreenView: View {
    var body: some View {
        ZStack {
            Group{ // Background
//                CameraView()
//                    .frame(width: 640, height: 480)
//                    .cornerRadius(10)
//                    .shadow(radius: 10)
                Image("layerStage-1")
                Image("bgStoneWall2")
                Image("bgTopBrickWall")
            }
            VStack {
                HStack(spacing: 360) {
                    Text("00:10")
                        .font(
                            Font.custom("Enriqueta", size: 64)
                                .weight(.bold)
                        )
                        .foregroundColor(.white)
                    Text("STAGE 1")
                        .font(
                            Font.custom("Enriqueta", size: 64)
                                .weight(.bold)
                        )
                        .foregroundColor(.white)
                    Text("􀊵􀊵􀊵")
                        .font(
                            Font.custom("Enriqueta", size: 64)
                                .weight(.bold)
                        )
                        .foregroundColor(.white)
                }
                .padding()
                Spacer()
                Text("EASY")
                
            }
        }
    }
}

#Preview {
    StagesScreenView()
}
