//
//  CameraViewController.swift
//  HoleInTheWallAlpha
//
//  Created by Reyhan Ariq Syahalam on 22/05/24.
//

import SwiftUI
import AVFoundation

// Full GPT
class CameraViewController: NSViewController, AVCapturePhotoCaptureDelegate {
    var captureSession: AVCaptureSession?
    var photoOutput: AVCapturePhotoOutput?
    private var photoCaptureCompletionBlock: ((NSImage?) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCamera()
    }
    
    func setupCamera() {
        captureSession = AVCaptureSession()
        captureSession?.sessionPreset = .high
        
        guard let videoDevice = AVCaptureDevice.default(for: .video) else {
            print("No video device found")
            return
        }
        
        do {
            let videoDeviceInput = try AVCaptureDeviceInput(device: videoDevice)
            if let captureSession = captureSession, captureSession.canAddInput(videoDeviceInput) {
                captureSession.addInput(videoDeviceInput)
                print("Video device input added to capture session")
            }
        } catch {
            print("Error setting up video device input: \(error)")
        }
        
        photoOutput = AVCapturePhotoOutput()
        if let captureSession = captureSession, captureSession.canAddOutput(photoOutput!) {
            captureSession.addOutput(photoOutput!)
            print("Photo output added to capture session")
        }
        
        let videoLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
        videoLayer.frame = view.bounds
        videoLayer.videoGravity = .resizeAspectFill
        videoLayer.autoresizingMask = [.layerWidthSizable, .layerHeightSizable]
        videoLayer.setAffineTransform(CGAffineTransform(scaleX: -1, y: 1))
        
        view.wantsLayer = true
        view.layer = CALayer()
        view.layer?.addSublayer(videoLayer)
        
        captureSession?.startRunning()
        print("Capture session started")
    }
    
    func capturePhoto(completion: @escaping (NSImage?) -> Void) {
        let settings = AVCapturePhotoSettings()
        photoCaptureCompletionBlock = completion
        photoOutput?.capturePhoto(with: settings, delegate: self)
        print("Photo capture initiated")
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if let error = error {
            print("Error capturing photo: \(error)")
            photoCaptureCompletionBlock?(nil)
            return
        }
        
        guard let imageData = photo.fileDataRepresentation() else {
            print("No image data representation")
            photoCaptureCompletionBlock?(nil)
            return
        }
        
        let image = NSImage(data: imageData)
        print("Photo capture completed")
        photoCaptureCompletionBlock?(image)
    }
}
