//
//  CameraView.swift
//  HoleInTheWallAlpha
//
//  Created by Reyhan Ariq Syahalam on 21/05/24.
//

import SwiftUI
import AVFoundation

struct CameraView: NSViewControllerRepresentable {
    func makeNSViewController(context: Context) -> NSViewController {
        return CameraViewController()
    }

    func updateNSViewController(_ nsViewController: NSViewController, context: Context) {}

    class CameraViewController: NSViewController {
        var captureSession: AVCaptureSession?

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

            let videoLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
            videoLayer.frame = CGRect(x: 0, y: 0, width: 688, height: 718)
            videoLayer.videoGravity = .resizeAspectFill

            view.wantsLayer = true
            view.layer = CALayer()
            view.layer?.addSublayer(videoLayer)

            captureSession?.startRunning()
        }
    }
}


#Preview {
    CameraView()
}
