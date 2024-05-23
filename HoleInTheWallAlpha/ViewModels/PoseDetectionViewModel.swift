//
//  PoseDetectionViewModel.swift
//  HoleInTheWallAlpha
//
//  Created by Reyhan Ariq Syahalam on 21/05/24.
//

import SwiftUI
import Vision
import VisionKit


class PoseDetectionViewModel: ObservableObject {
    @Published var jointPositions: [String: CGPoint] = [:]

    func detectBodyPose(in image: CGImage) {
        let request = VNDetectHumanBodyPoseRequest { request, error in
            guard let observations = request.results as? [VNHumanBodyPoseObservation] else {
                print("Tidak ada hasil yang terdeteksi.")
                return
            }
            for observation in observations {
                self.handleBodyPoseObservation(observation)
            }
        }

        let requestHandler = VNImageRequestHandler(cgImage: image, options: [:])
        do {
            try requestHandler.perform([request])
        } catch {
            print("Error melakukan request: \(error)")
        }
    }

    private func handleBodyPoseObservation(_ observation: VNHumanBodyPoseObservation) {
        do {
            let recognizedPoints = try observation.recognizedPoints(.all)
            var newPositions: [String: CGPoint] = [:]
            for (key, point) in recognizedPoints {
                if point.confidence > 0.1 {
                    newPositions[key.rawValue.rawValue] = point.location
                }
            }
            DispatchQueue.main.async {
                self.jointPositions = newPositions
            }
        } catch {
            print("Error mendapatkan titik yang dikenali: \(error)")
        }
    }
}

