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
    var level: String
    var score: Int
    
    init(name: String, level: String, score: Int) {
        self.name = name
        self.level = level
        self.score = score
        print("StageModel initialized with name: \(name)")
    }
}
