//
//  CameraView.swift
//  HoleInTheWallAlpha
//
//  Created by Reyhan Ariq Syahalam on 21/05/24.
//

import SwiftUI

struct CameraView: NSViewControllerRepresentable {
    func makeNSViewController(context: Context) -> VideoCaptureController {
        return VideoCaptureController()
    }

    func updateNSViewController(_ nsViewController: VideoCaptureController, context: Context) {
        // No updates needed for now
    }
}

#Preview {
    CameraView()
}
