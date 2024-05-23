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


}


#Preview {
    CameraView()
}
