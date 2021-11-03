//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Chris on 03/11/2021.
//

import AVKit
import Foundation

var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileFormat: String) -> AVPlayer {
    guard let url = Bundle.main.url(forResource: fileName, withExtension: fileFormat) else {
        fatalError()
    }
    
    videoPlayer = AVPlayer(url: url)
    videoPlayer?.play()
    
    return videoPlayer!
}
