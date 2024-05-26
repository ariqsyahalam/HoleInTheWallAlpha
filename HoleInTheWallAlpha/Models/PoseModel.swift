//
//  PoseModel.swift
//  HoleInTheWallAlpha
//
//  Created by Reyhan Ariq Syahalam on 21/05/24.
//

import Foundation
import Vision

class PoseModel {
    var jointPositions: [VNHumanBodyPoseObservation.JointName: CGPoint]
    
    init(jointPositions: [VNHumanBodyPoseObservation.JointName: CGPoint]) {
        self.jointPositions = jointPositions
        print("PoseModel initialized with joint positions: \(jointPositions)")
    }
}
