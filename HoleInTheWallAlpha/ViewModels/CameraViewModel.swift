//
//  CameraViewModel.swift
//  HoleInTheWallAlpha
//
//  Created by Reyhan Ariq Syahalam on 21/05/24.
//

import SwiftUI

class CameraViewModel: ObservableObject {
    @Published var cameraViewController: CameraViewController?
    
    func setupCamera() {
        // Setup camera
        print("Camera setup initiated.")
        cameraViewController?.setupCamera()
    }
}
