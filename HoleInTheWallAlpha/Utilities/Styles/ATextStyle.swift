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
                    .font(Font.custom("Enriqueta", size: 48).weight(.bold))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.42, green: 0.29, blue: 0.29))
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
                    .font(Font.custom("Enriqueta", size: 48).weight(.bold))
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

// Custom text style example usage:
// Text("Hello, World!")
//     .aText(.h1)
