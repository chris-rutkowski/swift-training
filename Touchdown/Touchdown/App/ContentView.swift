//
//  ContentView.swift
//  Touchdown
//
//  Created by Chris on 03/11/2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var shop: Shop
    
    var body: some View {
        
        VStack {
            if !shop.showingProduct && shop.selectedProduct == nil {
                VStack(spacing: 0) {
                NavigationBarView()
                    .padding()
                    .background(.white)
                    .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 5)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 0) {
                        FeaturedTabView()
                            .padding(.vertical, 20)
                            .frame(height: 270)
                        
                        CategoryGridView()
                        
                        TitleView(title: "Helmets")
                        LazyVGrid(columns: gridLayout, spacing: 15) {
                            ForEach(products) { item in
                                ProductItemView(model: item)
                                    .onTapGesture {
                                        withAnimation(.easeOut) {
                                            shop.selectedProduct = item
                                            shop.showingProduct = true
                                        }
                                    }
                            }
                        }
                        .padding(15)
                        
                        TitleView(title: "Brands")
                        BrandGridView()
                        
                        FooterView()
                            .padding(.horizontal)
                    }
                }
            }
                .background(colorBackground.ignoresSafeArea(.all, edges: .all))
            } else {
                ProductDetailView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Shop())
    }
}
