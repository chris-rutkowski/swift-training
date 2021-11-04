//
//  BrandItemView.swift
//  Touchdown
//
//  Created by Chris on 03/11/2021.
//

import SwiftUI

struct BrandItemView: View {
    let model: BrandModel
    
    var body: some View {
        Image(model.image)
            .resizable()
            .scaledToFit()
            .padding()
            .background(Color.white.cornerRadius(12))
            .background(
                RoundedRectangle(cornerRadius: 12).stroke(.gray, lineWidth: 1)
            )
    }
}

struct BrandItemView_Previews: PreviewProvider {
    static var previews: some View {
        BrandItemView(model: brands[0])
            .previewLayout(.sizeThatFits)
            .padding()
            .background(colorBackground)
    }
}
