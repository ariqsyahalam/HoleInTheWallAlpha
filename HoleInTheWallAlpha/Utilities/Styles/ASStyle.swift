//
//  ASStyle.swift
//  HoleInTheWallAlpha
//
//  Created by Reyhan Ariq Syahalam on 21/05/24.
//

import SwiftUI

enum ButtonStyleType {
    case primary
    case secondary
    // Tambahkan gaya lainnya jika diperlukan
}

extension View {
    func aButton(_ style: ButtonStyleType) -> some View {
        switch style {
        case .primary:
            return AnyView(
                self
                    .padding(.horizontal, 36)
                    .padding(.vertical, 10)
                    .background(.white)
                    .overlay(
                        Rectangle()
                            .inset(by: 2)
                            .stroke(Color(red: 0.4, green: 0.28, blue: 0.28), lineWidth: 4)
                        
                    )
            )
        case .secondary:
            return AnyView(
                self
                    .padding(16)
                    .background(Color.gray)
                    .foregroundColor(.black)
                    .cornerRadius(8)
            )
        }
    }
    
    func aText(_ style: ButtonStyleType) -> some View {
        switch style {
        case .primary:
            return AnyView(
                self
                    .font(
                        Font.custom("Enriqueta", size: 48)
                            .weight(.bold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.42, green: 0.29, blue: 0.29))
            )
        case .secondary:
            return AnyView(
                self
                    .padding(16)
                    .background(Color.gray)
                    .foregroundColor(.black)
                    .cornerRadius(8)
            )
        }
    }
}
