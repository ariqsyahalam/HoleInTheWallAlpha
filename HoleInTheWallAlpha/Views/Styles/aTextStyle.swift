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
                    .font(Font.custom("Enriqueta", size: 48)
                        .weight(.bold))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.42, green: 0.29, blue: 0.29))
            )
            
        case .h1:
            return AnyView(
                self
                    .font(
                        Font.custom("Enriqueta", size: 48)
                            .weight(.bold)
                    )
            )
            
        case .h2:
            return AnyView(
                self
                    .font(
                        Font.custom("Enriqueta", size: 48)
                            .weight(.bold)
                    )
            )
            
        case .h3:
            return AnyView(
                self
                    .font(
                        Font.custom("Enriqueta", size: 48)
                            .weight(.bold)
                    )
            )
        case .h4:
            return AnyView(
                self
                    .font(
                        Font.custom("Enriqueta", size: 48)
                            .weight(.bold)
                    )
            )
        case .h5:
            return AnyView(
                self
                    .font(
                        Font.custom("Enriqueta", size: 48)
                            .weight(.bold)
                    )
            )
        case .h6:
            return AnyView(
                self
                    .font(
                        Font.custom("Enriqueta", size: 48)
                            .weight(.bold)
                    )
            )
        case .h7:
            return AnyView(
                self
                    .font(
                        Font.custom("Enriqueta", size: 48)
                            .weight(.bold)
                    )
            )
        case .paragraph:
            return AnyView(
                self
                    .font(
                        Font.custom("Enriqueta", size: 12)
                            .weight(.bold)
                    )
            )
        case .caption:
            return AnyView(
                self
                    .font(
                        Font.custom("Enriqueta", size: 48)
                            .weight(.bold)
                    )
            )
        case .subtitle:
            return AnyView(
                self
                    .font(
                        Font.custom("Enriqueta", size: 48)
                            .weight(.bold)
                    )
            )
            
        case .title:
            return AnyView(
                self.font(
                    Font.custom("SF Mono", size: 200)
                        .weight(.bold)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
            )
            
        default:
            return AnyView(
                self
            )
        }
    }
    
}
