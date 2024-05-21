//
//  AButtonStyle.swift
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
    case disable
}

extension View {
    func aButton(_ type: AButtonType) -> some View {
        switch type {
            
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
        }
    }
}
