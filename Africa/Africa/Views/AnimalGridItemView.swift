//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Chris on 03/11/2021.
//

import SwiftUI

struct AnimalGridItemView: View {
    let model: AnimalModel
    var body: some View {
        Image(model.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

struct AnimalGridItemView_Previews: PreviewProvider {
    static var previews: some View {
        let animals: [AnimalModel] = Bundle.main.decode("animals.json")

        AnimalGridItemView(model: animals[2])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
