//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Chris on 03/11/2021.
//

import AVKit
import SwiftUI

struct VideoPlayerView: View {
    var fileName: String
    var title: String
    
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: fileName, fileFormat: "mp4")) {
//                Text(title)
            }
            .overlay(
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding(.top, 6)
                    .padding(.horizontal, 8)
                , alignment: .topLeading
            )
        }
        .accentColor(.accentColor)
        .navigationBarTitle(title, displayMode: .inline)
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideoPlayerView(fileName: "lion", title: "King the lion")
        }
    }
}
