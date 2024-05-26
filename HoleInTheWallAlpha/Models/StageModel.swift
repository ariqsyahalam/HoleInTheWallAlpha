//
//  StageModel.swift
//  HoleInTheWallAlpha
//
//  Created by Reyhan Ariq Syahalam on 20/05/24.
//

import Foundation

class StageModel: Identifiable {
    var id = UUID()
    var name: String
    
    init(name: String) {
        self.name = name
        print("StageModel initialized with name: \(name)")
    }
}
