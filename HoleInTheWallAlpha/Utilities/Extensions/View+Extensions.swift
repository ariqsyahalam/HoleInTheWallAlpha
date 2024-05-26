//
//  View+Extensions.swift
//  HoleInTheWallAlpha
//
//  Created by Reyhan Ariq Syahalam on 21/05/24.
//

import SwiftUI

enum AButtonType {
    case primary
}

enum AButtonState {
    case normal
    case disabled
}

extension View {
    func aButton(_ type: AButtonType) -> some View {
        switch type {
        case .primary:
            return AnyView(
                self
                    .padding(.horizontal, 36)
                    .padding(.vertical, 10)
                    .background(Color.white)
                    .overlay(
                        Rectangle()
                            .inset(by: 2)
                            .stroke(Color(red: 0.4, green: 0.28, blue: 0.28), lineWidth: 4)
                    )
            )
        }
    }
    
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
    
//    func applyButtonStyle(_ style: AButtonStyle) -> some View {
//        switch style {
//        case .primary:
//            return AnyView(
//                self
//                    .padding()
//                    .background(Color.blue)
//                    .foregroundColor(.white)
//                    .cornerRadius(8)
//            )
//        }
//    }
}
