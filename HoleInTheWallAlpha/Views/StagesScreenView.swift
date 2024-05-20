//
//  StagesScreenView.swift
//  HoleInTheWallAlpha
//
//  Created by Reyhan Ariq Syahalam on 20/05/24.
//

import SwiftUI

struct StagesScreenView: View {
    var body: some View {
        VStack {
            Text("HOLE")
                .font(
                    Font.custom("Inter", size: 128)
                        .weight(.bold)
                )
                .kerning(19.2)
                .foregroundColor(.black)
            Text("IN THE WALL")
                .font(
                    Font.custom("Inter", size: 48)
                        .weight(.black)
                )
                .kerning(9.12)
                .foregroundColor(.black)
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Start")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.black)
                    .font(
                        Font.custom("Inter", size: 24)
                            .weight(.black)
                    )
            })
            .padding(.horizontal, 10)
            .padding(.vertical, 24)
            .frame(width: 473, alignment: .center)
            .background(Color(red: 0.98, green: 0.87, blue: 0))
            
            .cornerRadius(16)
            .shadow(color: .black, radius: 0, x: 4, y: 4)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .inset(by: 0.5)
                    .stroke(.black, lineWidth: 1)
                
            )
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.yellow)
        
    }
}

#Preview {
    StagesScreenView()
}
