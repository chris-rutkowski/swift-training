//
//  RecipeRatingView.swift
//  Avocados
//
//  Created by Chris on 06/11/2021.
//

import SwiftUI

struct RecipeRatingView: View {
    let model: RecipeModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            ForEach(0..<model.rating, id: \.self) { _ in
                Image(systemName: "star.fill")
                    .font(.body)
                .foregroundColor(.yellow)
            }
        }
    }
}

struct RecipeRatingView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeRatingView(model: recipeData[5])
            .previewLayout(.fixed(width: 320, height: 60))
    }
}
