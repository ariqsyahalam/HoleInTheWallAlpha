//
//  StartScreenViewModel.swift
//  HoleInTheWallAlpha
//
//  Created by Reyhan Ariq Syahalam on 20/05/24.
//
//TO DO: masih ada comment

import SwiftUI

class StartScreenViewModel: ObservableObject {
//    let musicPlayer = MusicPlayer()
    
    func playBackgroundMusic() {
        MusicPlayer.shared.stopBackgroundMusic()
        MusicPlayer.shared.playBackgroundMusic(musicName: "gameplay", extensionType: "mp3")
        print("Background music started.")
    }
    // TO DO: masih ada comment
//    func stopBackgroundMusic() {
//        MusicPlayer.shared.audioPlayer?.stop()
//        print("Background music stopped.")
//    }
}
