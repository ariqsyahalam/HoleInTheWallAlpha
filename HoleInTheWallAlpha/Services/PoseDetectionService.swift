////
////  PoseDetectionService.swift
////  HoleInTheWallAlpha
////
////  Created by Reyhan Ariq Syahalam on 22/05/24.
////
//
//import Vision
//import VisionKit
//
//class PoseDetectionService {
//    func detectBodyPose(in image: CGImage, completion: @escaping ([VNHumanBodyPoseObservation]) -> Void) {
//        let request = VNDetectHumanBodyPoseRequest { request, error in
//            guard let observations = request.results as? [VNHumanBodyPoseObservation] else {
//                print("No results detected")
//                completion([])
//                return
//            }
//            completion(observations)
//        }
//        
//        let requestHandler = VNImageRequestHandler(cgImage: image, options: [:])
//        do {
//            try requestHandler.perform([request])
//            print("Body pose detection request performed")
//        } catch {
//            print("Error performing body pose detection request: \(error)")
//            completion([])
//        }
//    }
//    
//    func extractJointPositions(from observations: [VNHumanBodyPoseObservation]) -> [String: CGPoint] {
//        var jointPositions: [String: CGPoint] = [:]
//        for observation in observations {
//            do {
//                let recognizedPoints = try observation.recognizedPoints(.all)
//                for (key, point) in recognizedPoints {
//                    if point.confidence > 0.1 {
//                        jointPositions[key.rawValue.rawValue] = point.location
//                    }
//                }
//            } catch {
//                print("Error obtaining recognized points: \(error)")
//            }
//        }
//        print("Extracted joint positions: \(jointPositions)")
//        return jointPositions
//    }
//}
