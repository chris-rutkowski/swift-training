//
//  InsetFactView.swift
//  Africa
//
//  Created by Chris on 03/11/2021.
//

import SwiftUI

struct InsetFactView: View {
    let animal: AnimalModel
    
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        }
    }
}

struct InsetFactView_Previews: PreviewProvider {
    static var previews: some View {
        let animals: [AnimalModel] = Bundle.main.decode("animals.json")

        InsetFactView(animal: animals[6])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
