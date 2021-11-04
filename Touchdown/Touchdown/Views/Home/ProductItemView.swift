//
//  ProductItemView.swift
//  Touchdown
//
//  Created by Chris on 03/11/2021.
//

import SwiftUI

struct ProductItemView: View {
    let model: ProductModel
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            ZStack {
                Image(model.image)
                    .resizable()
                    .scaledToFit()
                    .padding(10)
            }
            .background(model.backgroundColor)
            .cornerRadius(12)
            
            Text(model.name)
                .font(.title3)
                .fontWeight(.black)
            
            Text(model.formattedPrice)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
        }
    }
}

struct ProductItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProductItemView(model: products[0])
            .previewLayout(.fixed(width: 200, height: 300))
            .padding()
            .background(colorBackground)
    }
}
