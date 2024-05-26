//
//  StartScreenViewModel.swift
//  HoleInTheWallAlpha
//
//  Created by Reyhan Ariq Syahalam on 20/05/24.
//

import SwiftUI

class StartScreenViewModel: ObservableObject {
//    let musicPlayer = MusicPlayer()
    
    func playBackgroundMusic() {
        MusicPlayer.shared.stopBackgroundMusic()
        MusicPlayer.shared.playBackgroundMusic(musicName: "gameplay", extensionType: "mp3")
        print("Background music started.")
    }
    
//    func stopBackgroundMusic() {
//        MusicPlayer.shared.audioPlayer?.stop()
//        print("Background music stopped.")
//    }
}
