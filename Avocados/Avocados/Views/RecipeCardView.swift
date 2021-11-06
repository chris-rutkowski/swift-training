//
//  RecipeCardView.swift
//  Avocados
//
//  Created by Chris on 06/11/2021.
//

import SwiftUI

struct RecipeCardView: View {
    let model: RecipeModel
    private let hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    @State private var showModal = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(model.imageName)
                .resizable()
                .scaledToFit()
                .overlay(
                    HStack {
                        Spacer()
                        VStack {
                            Image(systemName: "bookmark")
                                .font(.title.weight(.light))
                                .foregroundColor(.white)
                                .imageScale(.small)
                            .shadow(color: Color("ColorBlackTransparentLight"), radius: 2, x: 0, y: 0)
                            .padding(.trailing, 20)
                            .padding(.top, 20)
                            
                            Spacer()
                        }
                    }
                )
            
            VStack(alignment: .leading, spacing: 12) {
                Text(model.title)
                    .font(.system(.title, design: .serif))
                    .fontWeight(.bold)
                    .foregroundColor(Color("ColorGreenMedium"))
                    .lineLimit(1)
                
                Text(model.headline)
                    .font(.system(.body, design: .serif))
                    .foregroundColor(.gray)
                    .italic()
                
                RecipeRatingView(model: model)
                
                RecipeCookingView(model: model)
            }
            .padding()
            .padding(.bottom, 12)
        }
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x: 0, y: 0)
        .onTapGesture {
            hapticImpact.impactOccurred()
            showModal = true
        }
        .sheet(isPresented: $showModal) {
            RecipeDetailView(model: model)
        }
    }
}

struct RecipeCardView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCardView(model: recipeData[3])
            .previewLayout(.sizeThatFits)
    }
}
