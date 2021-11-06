//
//  RecipeModel.swift
//  Avocados
//
//  Created by Chris on 06/11/2021.
//

import Foundation

struct RecipeModel: Identifiable {
    let id = UUID()
    let title: String
    let headline: String
    let imageName: String
    let rating: Int
    let serves: Int
    let preparation: Int
    let cooking: Int
    let instructions: [String]
    let ingredients: [String]
}
