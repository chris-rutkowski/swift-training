//
//  ExternalLinkView.swift
//  Africa
//
//  Created by Chris on 03/11/2021.
//

import SwiftUI

struct ExternalLinkView: View {
    let animal: AnimalModel
    
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    
                    Link(animal.name, destination: URL(string: animal.link) ?? URL(string: "https://wikipedia.org")!)
                }
                .foregroundColor(.accentColor)
            }
        }
    }
}

struct ExternalLinkView_Previews: PreviewProvider {
    static var previews: some View {
        let animals: [AnimalModel] = Bundle.main.decode("animals.json")

        ExternalLinkView(animal: animals[10])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
