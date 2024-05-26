//
//  MusicPlayer.swift
//  HoleInTheWallAlpha
//
//  Created by Reyhan Ariq Syahalam on 22/05/24.
//

import Foundation
import AVFAudio

class MusicPlayer: NSObject, AVAudioPlayerDelegate {
    static let shared = MusicPlayer()
    
    var audioPlayer: AVAudioPlayer?
    
    override init() {
        super.init()
    }

    func playBackgroundMusic(musicName: String, extensionType: String) {
        guard let url = Bundle.main.url(forResource: musicName, withExtension: extensionType) else {
            print("Could not find the file: \(musicName).\(extensionType)")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.delegate = self
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
            print("Background music started: \(musicName).\(extensionType)")
        } catch {
            print("Could not create audio player: \(error)")
        }
    }
    
    func stopBackgroundMusic() {
        audioPlayer?.stop()
        print("Background music stopped.")
    }
    
    // AVAudioPlayerDelegate methods
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print("Audio player finished playing: \(flag ? "Successfully" : "With error")")
    }
    
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        if let error = error {
            print("Audio player decode error: \(error.localizedDescription)")
        }
    }
}
