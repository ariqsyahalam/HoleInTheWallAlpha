//
//  CameraView.swift
//  HoleInTheWallAlpha
//
//  Created by Reyhan Ariq Syahalam on 21/05/24.
//

import SwiftUI

struct CameraView: NSViewControllerRepresentable {
    @Binding var cameraViewController: CameraViewController?
    
    class Coordinator: NSObject {
        var parent: CameraView
        
        init(parent: CameraView) {
            self.parent = parent
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeNSViewController(context: Context) -> CameraViewController {
        let viewController = CameraViewController()
        DispatchQueue.main.async {
            self.cameraViewController = viewController
        }
        return viewController
    }

    func updateNSViewController(_ nsViewController: CameraViewController, context: Context) {}
}

#Preview {
    CameraView(cameraViewController: .constant(nil))
}
