//
//  CameraController.swift
//  HoleInTheWallAlpha
//
//  Created by Reyhan Ariq Syahalam on 22/05/24.
//

import SwiftUI
import AVFoundation

class CameraViewController: NSViewController, AVCapturePhotoCaptureDelegate {
    var captureSession: AVCaptureSession?
    var photoOutput: AVCapturePhotoOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCamera()
    }
    
    private func setupCamera() {
        captureSession = AVCaptureSession()
        captureSession?.sessionPreset = .high
        
        guard let videoDevice = AVCaptureDevice.default(for: .video) else { return }
        let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice)
        
        if let captureSession = captureSession,
           captureSession.canAddInput(videoDeviceInput!) {
            captureSession.addInput(videoDeviceInput!)
        }
        
        photoOutput = AVCapturePhotoOutput()
        if let captureSession = captureSession,
           captureSession.canAddOutput(photoOutput!) {
            captureSession.addOutput(photoOutput!)
        }
        
        let videoLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
        videoLayer.frame = view.bounds
        videoLayer.videoGravity = .resizeAspectFill
        videoLayer.setAffineTransform(CGAffineTransform(scaleX: -1, y: 1))
        
        view.wantsLayer = true
        view.layer = CALayer()
        view.layer?.addSublayer(videoLayer)
        
        captureSession?.startRunning()
    }
    
    func capturePhoto(completion: @escaping (NSImage?) -> Void) {
        let settings = AVCapturePhotoSettings()
        photoOutput?.capturePhoto(with: settings, delegate: self)
        self.photoCaptureCompletionBlock = completion
    }
    
    private var photoCaptureCompletionBlock: ((NSImage?) -> Void)?
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let imageData = photo.fileDataRepresentation() else {
            self.photoCaptureCompletionBlock?(nil)
            return
        }
        let image = NSImage(data: imageData)
        self.photoCaptureCompletionBlock?(image)
    }
}
