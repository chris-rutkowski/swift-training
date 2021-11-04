//
//  CategoryModel.swift
//  Touchdown
//
//  Created by Chris on 03/11/2021.
//

import Foundation

struct CategoryModel: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
}
