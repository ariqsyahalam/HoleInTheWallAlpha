//
//  StagesScreenView.swift
//  HoleInTheWallAlpha
//
//  Created by Reyhan Ariq Syahalam on 20/05/24.
//

import SwiftUI
import CoreML

struct StagesScreenView: View {
    @State var timeRemaining = 10
    @State var timer: Timer? = nil
    @State private var inputImage: NSImage? = NSImage(named: "testPose")
    @State private var predictionResult: String = ""
    @State private var image: NSImage?
    @State private var cameraViewController: CameraViewController?
    @State private var capturedImageURL: URL?

    let model = ModelPose1() // Nama model yang dihasilkan oleh Xcode
    
    var body: some View {
        ZStack(alignment: .center) {
            ZStack { // Background
                Image("bgStage")
                    .ignoresSafeArea()
                CameraView(cameraViewController: $cameraViewController)
                    .frame(width: 688, height: 718)
                    .offset(CGSize(width: 10, height: 76.0))
                Image("stageWall-1")
            }
            VStack {
                
            }
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    VStack {
                        Text("SCORE")
                            .font(Font.custom("SF Mono", size: 16))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                        Text("1000")
                            .font(
                                Font.custom("SF Mono", size: 24)
                                    .weight(.bold)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                    }
                    Spacer()
                    VStack {
                        Text("TIME")
                            .font(
                                Font.custom("SF Mono", size: 24)
                                    .weight(.semibold)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                        Text("\(timeRemaining)")
                            .font(
                                Font.custom("SF Mono", size: 48)
                                    .weight(.bold)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                    }
                    Spacer()
                    VStack {
                        Text("LEVEL")
                            .font(Font.custom("SF Mono", size: 16))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                        Text("EASY")
                            .font(
                                Font.custom("SF Mono", size: 24)
                                    .weight(.bold)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
                Spacer()
                
            }
            .padding(.top, 28.0)
            .frame(width: 1728, height: 1117)
        }
        .ignoresSafeArea()
        .onAppear {
            startTimer()  // Start the timer when the view appears
        }
    }
    
    func startTimer() {
        timer?.invalidate() // Invalidate any existing timer
        timeRemaining = 10  // Reset the time remaining
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                timer.invalidate()  // Stop the timer when it reaches 0
                capturePhoto()
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
                print(filename)
                self.predict()
            }
        }
    }
    
    func predict() {
        guard let url = capturedImageURL,
              let image = NSImage(contentsOf: url),
              let pixelBuffer = buffer(from: image) else {
            predictionResult = "Konversi gambar gagal"
            return
        }
        
        do {
            let input = ModelPose1Input(image: pixelBuffer)
            let prediction = try model.prediction(input: input)
            predictionResult = prediction.target
            print(predictionResult)
        } catch {
            predictionResult = "Prediksi gagal: \(error.localizedDescription)"
        }
    }
}

func buffer(from image: NSImage) -> CVPixelBuffer? {
    // Implementasi fungsi buffer(from:) sama seperti sebelumnya
    guard let tiffData = image.tiffRepresentation,
          let bitmapImage = NSBitmapImageRep(data: tiffData) else {
        return nil
    }
    
    let width = 299
    let height = 299
    
    let attrs = [
        kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue,
        kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue
    ] as CFDictionary
    
    var pixelBuffer: CVPixelBuffer?
    let status = CVPixelBufferCreate(kCFAllocatorDefault, width, height, kCVPixelFormatType_32ARGB, attrs, &pixelBuffer)
    
    guard status == kCVReturnSuccess, let buffer = pixelBuffer else {
        return nil
    }
    
    CVPixelBufferLockBaseAddress(buffer, .readOnly)
    guard let context = CGContext(data: CVPixelBufferGetBaseAddress(buffer),
                                  width: width,
                                  height: height,
                                  bitsPerComponent: 8,
                                  bytesPerRow: CVPixelBufferGetBytesPerRow(buffer),
                                  space: CGColorSpaceCreateDeviceRGB(),
                                  bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue) else {
        CVPixelBufferUnlockBaseAddress(buffer, .readOnly)
        return nil
    }
    
    let imageRect = CGRect(x: 0, y: 0, width: width, height: height)
    context.draw(bitmapImage.cgImage!, in: imageRect)
    CVPixelBufferUnlockBaseAddress(buffer, .readOnly)
    
    return buffer
}

#Preview {
    StagesScreenView()
}
