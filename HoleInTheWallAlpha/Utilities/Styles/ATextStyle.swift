//
//  ATextStyle.swift
//  HoleInTheWallAlpha
//
//  Created by Reyhan Ariq Syahalam on 21/05/24.
//

import SwiftUI

struct ATextStyle {
    
    enum TextStyle {
        case h1
        case h2
        case h3
        case h4
        case h5
        case h6
        case h7
        case paragraph
        case caption
        case title
        case subtitle
        case button
        case frontTitle
    }
    
    enum TextWeight {
        case light
        case regular
        case bold
    }
}

extension View {
   
    func aText(_ style: ATextStyle.TextStyle) -> some View {
        switch style {
        case .button:
            return AnyView(
                self
                    .font(
                        Font.custom("SF Mono", size: 32)
                            .weight(.bold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
            )
        case .h1, .h2, .h3, .h4, .h5, .h6, .h7:
            return AnyView(
                self
                    .font(Font.custom("Enriqueta", size: 48).weight(.bold))
            )
        case .paragraph:
            return AnyView(
                self
                    .font(Font.custom("Enriqueta", size: 12).weight(.bold))
            )
        case .caption, .subtitle:
            return AnyView(
                self
                    .font(
                        Font.custom("SF Mono", size: 96)
                            .weight(.light)
                    )
                    .kerning(27.84)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
            )
        case .title:
            return AnyView(
                self
                    .font(Font.custom("SF Mono", size: 200).weight(.bold))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
            )
        default:
            return AnyView(self)
        }
    }
}

//TO DO: masih ada comment

// Custom text style example usage:
// Text("Hello, World!")
//     .aText(.h1)
