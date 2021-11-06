//
//  RecipeCookingView.swift
//  Avocados
//
//  Created by Chris on 06/11/2021.
//

import SwiftUI

struct RecipeCookingView: View {
    let model: RecipeModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            HStack(alignment: .center, spacing: 2) {
                Image(systemName: "person.2")
                Text("Serves: \(model.serves)")
            }
            
            HStack(alignment: .center, spacing: 2) {
                Image(systemName: "clock")
                Text("Serves: \(model.preparation)")
            }
            
            HStack(alignment: .center, spacing: 2) {
                Image(systemName: "flame")
                Text("Serves: \(model.cooking)")
            }
        }
        .font(.footnote)
        .foregroundColor(.gray)
    }
}

struct RecipeCookingView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCookingView(model: recipeData[1])
            .previewLayout(.fixed(width: 320, height: 60))
    }
}
