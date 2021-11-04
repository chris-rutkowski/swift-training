//
//  ProductModel.swift
//  Touchdown
//
//  Created by Chris on 03/11/2021.
//

import SwiftUI

struct ProductModel: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
    let price: Int
    let description: String
    let color: [Double]
    
    var formattedPrice: String {
        "$\(price)"
    }
    
    var backgroundColor: Color {
        Color(red: color[0], green: color[1], blue: color[2])
    }
}
