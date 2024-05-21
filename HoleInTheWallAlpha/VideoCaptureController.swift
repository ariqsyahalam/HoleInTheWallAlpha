//
//  VideoCaptureController.swift
//  HoleInTheWallAlpha
//
//  Created by Reyhan Ariq Syahalam on 21/05/24.
//

import SwiftUI
import AVFoundation

class VideoCaptureController: NSViewController {
    var captureSession: AVCaptureSession!
    var videoPreviewLayer: AVCaptureVideoPreviewLayer!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup Capture Session
        captureSession = AVCaptureSession()
        captureSession.sessionPreset = .high

        // Setup Capture Device
        guard let captureDevice = AVCaptureDevice.default(for: .video) else {
            print("Failed to get the default camera device.")
            return
        }

        do {
            let input = try AVCaptureDeviceInput(device: captureDevice)
            if captureSession.canAddInput(input) {
                captureSession.addInput(input)
            }
        } catch {
            print("Error accessing camera: \(error)")
            return
        }

        // Setup Preview Layer
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        videoPreviewLayer.videoGravity = .resizeAspectFill
        
        // Unwrap view.layer safely
        guard let viewLayer = view.layer else {
            print("Failed to get the view's layer.")
            return
        }

        videoPreviewLayer.frame = viewLayer.bounds
        viewLayer.addSublayer(videoPreviewLayer)

        // Start Capture Session
        captureSession.startRunning()
    }

    override func viewWillLayout() {
        super.viewWillLayout()
        
        // Unwrap view.layer safely
        if let viewLayer = view.layer {
            videoPreviewLayer.frame = viewLayer.bounds
        }
    }
}
