//
//  RipeningModel.swift
//  Avocados
//
//  Created by Chris on 06/11/2021.
//

import Foundation

struct RipeningModel: Identifiable {
    let id = UUID()
    let imageName: String
    let stage: String
    let title: String
    let description: String
    let ripeness: String
    let instruction: String
}
