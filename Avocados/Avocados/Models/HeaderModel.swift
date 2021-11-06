//
//  HeaderModel.swift
//  Avocados
//
//  Created by Chris on 05/11/2021.
//

import Foundation

struct HeaderModel: Identifiable {
    let id = UUID()
    let imageName: String
    let headline: String
    let subheadline: String
}
