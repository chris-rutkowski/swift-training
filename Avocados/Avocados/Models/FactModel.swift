//
//  FactModel.swift
//  Avocados
//
//  Created by Chris on 06/11/2021.
//

import Foundation

struct FactModel: Identifiable {
    let id = UUID()
    let imageName: String
    let content: String
}
