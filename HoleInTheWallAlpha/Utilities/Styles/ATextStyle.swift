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

// Custom text style example usage:
// Text("Hello, World!")
//     .aText(.h1)
