//
//  VideoModel.swift
//  Africa
//
//  Created by Chris on 03/11/2021.
//

import Foundation

struct VideoModel: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    var thumbnail: String {
        "video-\(id)"
    }
}
