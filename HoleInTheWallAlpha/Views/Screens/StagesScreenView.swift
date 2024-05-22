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
        }.ignoresSafeArea()
    }
}

#Preview {
    StagesScreenView()
}
