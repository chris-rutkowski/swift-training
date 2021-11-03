//
//  CoverImageView.swift
//  Africa
//
//  Created by Chris on 03/11/2021.
//

import SwiftUI

struct CoverImageView: View {
    let models: [CoverImageModel] = Bundle.main.decode("covers.json")
    
    var body: some View {
        TabView {
            ForEach(models) { item in
                Image(item.name)
                    .resizable()
                .scaledToFill()
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
