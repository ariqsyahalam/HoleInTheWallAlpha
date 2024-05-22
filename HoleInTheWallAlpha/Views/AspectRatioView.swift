//
//  AspectRatioView.swift
//  HoleInTheWallAlpha
//
//  Created by Reyhan Ariq Syahalam on 21/05/24.
//

import SwiftUI

struct AspectRatioView<Content: View>: View {
    let content: Content
    let aspectRatio: CGFloat

    init(aspectRatio: CGFloat, @ViewBuilder content: () -> Content) {
        self.aspectRatio = aspectRatio
        self.content = content()
    }

    var body: some View {
        GeometryReader { geometry in
            let screenWidth = geometry.size.width
            let calculatedHeight = screenWidth / aspectRatio

            content
                .frame(width: screenWidth, height: calculatedHeight)
        }
    }
}

