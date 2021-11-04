//
//  Constant.swift
//  Touchdown
//
//  Created by Chris on 03/11/2021.
//

import SwiftUI

// Data
let brands: [BrandModel] = Bundle.main.decode("brand.json")
let categories: [CategoryModel] = Bundle.main.decode("category.json")
let players: [PlayerModel] = Bundle.main.decode("player.json")
let products: [ProductModel] = Bundle.main.decode("product.json")
let sampleProduct = products[0]

// Color
let colorBackground = Color("ColorBackground")
let colorGray = Color(UIColor.systemGray4)

// Layout

let columnSpacing: CGFloat = 10
let rowSpacing: CGFloat = 10
var gridLayout: [GridItem] {
    Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 2)
}
// Ux

// Api

// Image

// Font

// String

// Misc
