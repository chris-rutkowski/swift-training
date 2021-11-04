//
//  Shop.swift
//  Touchdown
//
//  Created by Chris on 04/11/2021.
//

import Foundation

class Shop: ObservableObject {
    @Published var showingProduct = false
    @Published var selectedProduct: ProductModel?
}
