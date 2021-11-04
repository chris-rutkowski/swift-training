//
//  TitleView.swift
//  Touchdown
//
//  Created by Chris on 03/11/2021.
//

import SwiftUI

struct TitleView: View {
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            Spacer()
        }
        .padding(.horizontal)
        .padding(.top, 15)
        .padding(.bottom, 10)
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(title: "Products")
            .previewLayout(.sizeThatFits)
            .background(colorBackground)
    }
}
