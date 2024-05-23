//
//  MusicPlayer.swift
//  HoleInTheWallAlpha
//
//  Created by Reyhan Ariq Syahalam on 22/05/24.
//

import Foundation
import AVFAudio

class MusicPlayer: NSObject, AVAudioPlayerDelegate {
    var audioPlayer: AVAudioPlayer?

    func playBackgroundMusic(musicName: String, extensionType: String) {
        guard let url = Bundle.main.url(forResource: "\(musicName)", withExtension: "\(extensionType)") else {
            print("Could not find the file.")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.delegate = self
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            print("Could not create audio player: \(error)")
        }
    }
}
