//
//  StagesScreenViewModel.swift
//  HoleInTheWallAlpha
//
//  Created by Reyhan Ariq Syahalam on 20/05/24.
//

import SwiftUI
import CoreML

class StagesScreenViewModel: ObservableObject {
    @Published var timeRemaining = 10
    @Published var predictionResult: String = ""
    @Published var image: NSImage?
    @Published var cameraViewController: CameraViewController?
    @Published var capturedImageURL: URL?
    
    let model = Pose1Model() // Nama model yang dihasilkan oleh Xcode
    private var timer: Timer?
    
    func startTimer() {
        timer?.invalidate() // Invalidate any existing timer
        timeRemaining = 10  // Reset the time remaining
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
                print("Time remaining: \(self.timeRemaining) seconds")
            } else {
                timer.invalidate()  // Stop the timer when it reaches 0
                print("Timer finished. Capturing photo...")
                self.capturePhoto()
            }
        }
    }
    
    func capturePhoto() {
        cameraViewController?.capturePhoto { image in
            self.image = image
            if let image = image, let data = image.tiffRepresentation {
                let filename = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("captured_photo.tiff")
                try? data.write(to: filename)
                self.capturedImageURL = filename
                print("Captured image saved at: \(filename)")
                self.predict()
            }
        }
    }
    
    func predict() {
        guard let url = capturedImageURL,
              let image = NSImage(contentsOf: url),
              let pixelBuffer = buffer(from: image) else {
            predictionResult = "Konversi gambar gagal"
            print("Image conversion failed.")
            return
        }
        
        do {
            let input = ModelPose1Input(image: pixelBuffer)
            let prediction = try model.prediction(input: input)
            predictionResult = prediction.target
            print("Prediction result: \(predictionResult)")
        } catch {
            predictionResult = "Prediksi gagal: \(error.localizedDescription)"
            print("Prediction failed: \(error.localizedDescription)")
        }
    }
}
