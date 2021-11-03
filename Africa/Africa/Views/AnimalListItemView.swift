//
//  AnimalListItemView.swift
//  Africa
//
//  Created by Chris on 03/11/2021.
//

import SwiftUI

struct AnimalListItemView: View {
    let model: AnimalModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(model.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(
                    RoundedRectangle(cornerRadius: 12)
                )
            
            VStack(alignment: .leading, spacing: 8) {
                Text(model.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                
                Text(model.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing, 8)
            }
        }
    }
}

struct AnimalListItemView_Previews: PreviewProvider {
    static var previews: some View {
        let animals: [AnimalModel] = Bundle.main.decode("animals.json")
        AnimalListItemView(model: animals[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
