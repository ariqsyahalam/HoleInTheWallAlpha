//
//  PoseDetectionViewModel.swift
//  HoleInTheWallAlpha
//
//  Created by Reyhan Ariq Syahalam on 21/05/24.
//

import Vision
import SwiftUI
import AVFoundation

class PoseDetectionViewModel: ObservableObject {
    private var requests = [VNRequest]()
    
    init() {
        setupVision()
    }
    
    private func setupVision() {
        let poseRequest = VNDetectHumanBodyPoseRequest(completionHandler: handlePoseDetection)
        self.requests = [poseRequest]
    }
    
    private func handlePoseDetection(request: VNRequest, error: Error?) {
        guard let observations = request.results as? [VNHumanBodyPoseObservation] else { return }
        for observation in observations {
            processObservation(observation)
        }
    }
    
    private func processObservation(_ observation: VNHumanBodyPoseObservation) {
        do {
            let recognizedPoints = try observation.recognizedPoints(forGroupKey: .all)
            // Process the recognized points
            print(recognizedPoints)
        } catch {
            print("Error processing observation: \(error)")
        }
    }
    
    func performRequest(on pixelBuffer: CVPixelBuffer) {
        let requestHandler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:])
        do {
            try requestHandler.perform(requests)
        } catch {
            print("Failed to perform request: \(error)")
        }
    }
}

