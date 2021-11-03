//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Chris on 03/11/2021.
//

import SwiftUI

struct AnimalDetailView: View {
    let model: AnimalModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                Image(model.image)
                    .resizable()
                    .scaledToFit()
                
                Text(model.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 24)
                    )
                
                Text(model.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
                    .foregroundColor(.accentColor)
                
                Group {
                    HeadingView(image: "photo.on.rectangle.angled", text: "Wilderness in Pictures")
                    
                    InsetGalleryView(animal: model)
                }
                .padding(.horizontal)
                
                Group {
                    HeadingView(image: "questionmark.circle", text: "Did you know?")
                    
                    InsetFactView(animal: model)
                }
                .padding(.horizontal)
                
                Group {
                    HeadingView(image: "info.circle", text: "All about \(model.name)")
                    
                    Text(model.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                    
                }
                .padding(.horizontal)
                
                Group {
                    HeadingView(image: "map", text: "National Parks")
                    InsetMapView()
                }
                .padding(.horizontal)
                
                Group {
                    HeadingView(image: "books.vertical", text: "Learn more")
                    ExternalLinkView(animal: model)
                }
                .padding(.horizontal)
            }
        }
        .navigationBarTitle("Learn about \(model.name)", displayMode: .inline)
    }
}

struct AnimalDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let animals: [AnimalModel] = Bundle.main.decode("animals.json")
        
        NavigationView {
            AnimalDetailView(model: animals[2])
        }
    }
}
