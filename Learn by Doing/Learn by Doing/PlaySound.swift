//
//  PlaySound.swift
//  Learn by Doing
//
//  Created by Chris on 05/11/2021.
//

import AVFoundation
import Foundation


private var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            
        }
    }
}
