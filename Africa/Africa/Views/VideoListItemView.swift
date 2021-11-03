//
//  VideoListItemView.swift
//  Africa
//
//  Created by Chris on 03/11/2021.
//

import SwiftUI

struct VideoListItemView: View {
    let model: VideoModel
    
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                Image(model.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                .cornerRadius(9)
                
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 4)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text(model.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                
                Text(model.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
        }
    }
}

struct VideoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        let videos: [VideoModel] = Bundle.main.decode("videos.json")

        VideoListItemView(model: videos[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
