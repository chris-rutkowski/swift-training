//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Chris on 03/11/2021.
//

import SwiftUI

struct InsetGalleryView: View {
    let animal: AnimalModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    .cornerRadius(12)
                }
            }
        }
        
    }
}

struct InsetGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        let animals: [AnimalModel] = Bundle.main.decode("animals.json")

        InsetGalleryView(animal: animals[5])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
