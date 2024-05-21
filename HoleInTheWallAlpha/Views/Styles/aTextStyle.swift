//
//  ATextStyle.swift
//  HoleInTheWallAlpha
//
//  Created by Reyhan Ariq Syahalam on 21/05/24.
//

import SwiftUI

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
}

extension View {
    
    func aText(_ style: TextStyle) -> some View {
        switch style {
        case .button:
            return AnyView(
                self
                    .font(
                        Font.custom("Enriqueta", size: 48)
                            .weight(.bold)
                    )
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
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.42, green: 0.29, blue: 0.29))
            )
        case .h2:
            return AnyView(
                self
                    .font(
                        Font.custom("Enriqueta", size: 48)
                            .weight(.bold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.42, green: 0.29, blue: 0.29))
            )
        case .h3:
            return AnyView(
                self
                    .font(
                        Font.custom("Enriqueta", size: 48)
                            .weight(.bold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.42, green: 0.29, blue: 0.29))
            )
        case .h4:
            return AnyView(
                self
                    .font(
                        Font.custom("Enriqueta", size: 48)
                            .weight(.bold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.42, green: 0.29, blue: 0.29))
            )
        case .h5:
            return AnyView(
                self
                    .font(
                        Font.custom("Enriqueta", size: 48)
                            .weight(.bold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.42, green: 0.29, blue: 0.29))
            )
        case .h6:
            return AnyView(
                self
                    .font(
                        Font.custom("Enriqueta", size: 48)
                            .weight(.bold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.42, green: 0.29, blue: 0.29))
            )
        case .h7:
            return AnyView(
                self
                    .font(
                        Font.custom("Enriqueta", size: 48)
                            .weight(.bold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.42, green: 0.29, blue: 0.29))
            )
        case .paragraph:
            return AnyView(
                self
                    .font(
                        Font.custom("Enriqueta", size: 48)
                            .weight(.bold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.42, green: 0.29, blue: 0.29))
            )
        case .caption:
            return AnyView(
                self
                    .font(
                        Font.custom("Enriqueta", size: 48)
                            .weight(.bold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.42, green: 0.29, blue: 0.29))
            )
        case .title:
            return AnyView(
                self
                    .font(
                        Font.custom("Enriqueta", size: 48)
                            .weight(.bold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.42, green: 0.29, blue: 0.29))
            )
        case .subtitle:
            return AnyView(
                self
                    .font(
                        Font.custom("Enriqueta", size: 48)
                            .weight(.bold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.42, green: 0.29, blue: 0.29))
            )
        }
    }
    
}
