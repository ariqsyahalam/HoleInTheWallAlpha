////
////  PoseDetectionViewModel.swift
////  HoleInTheWallAlpha
////
////  Created by Reyhan Ariq Syahalam on 21/05/24.
////
//
//import SwiftUI
//import Vision
//import VisionKit
//
//class PoseDetectionViewModel: ObservableObject {
//    @Published var jointPositions: [String: CGPoint] = [:]
//
//    func detectBodyPose(in image: CGImage) {
//        let request = VNDetectHumanBodyPoseRequest { request, error in
//            guard let observations = request.results as? [VNHumanBodyPoseObservation] else {
//                print("No results detected.")
//                return
//            }
//            for observation in observations {
//                self.handleBodyPoseObservation(observation)
//            }
//        }
//
//        let requestHandler = VNImageRequestHandler(cgImage: image, options: [:])
//        do {
//            try requestHandler.perform([request])
//            print("Body pose detection performed.")
//        } catch {
//            print("Error performing request: \(error)")
//        }
//    }
//
//    private func handleBodyPoseObservation(_ observation: VNHumanBodyPoseObservation) {
//        do {
//            let recognizedPoints = try observation.recognizedPoints(.all)
//            var newPositions: [String: CGPoint] = [:]
//            for (key, point) in recognizedPoints {
//                if point.confidence > 0.1 {
//                    newPositions[key.rawValue.rawValue] = point.location
//                }
//            }
//            DispatchQueue.main.async {
//                self.jointPositions = newPositions
//                print("Joint positions updated: \(newPositions)")
//            }
//        } catch {
//            print("Error obtaining recognized points: \(error)")
//        }
//    }
//}
