//
//  FactsView.swift
//  Avocados
//
//  Created by Chris on 06/11/2021.
//

import SwiftUI

struct FactsView: View {
    let model: FactModel
    
    var body: some View {
        ZStack {
            Text(model.content)
                .padding(.leading, 55)
                .padding(.trailing, 15)
                .padding(.vertical, 3)
                .frame(width: 300, height: 135, alignment: .center)
                .background(
                    LinearGradient(
                        colors: [Color("ColorGreenMedium"), Color("ColorGreenLight")],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .cornerRadius(12)
                .lineLimit(6)
                .multilineTextAlignment(.leading)
                .font(.footnote)
                .foregroundColor(.white)
            
            Image(model.imageName)
                .resizable()
                .frame(width: 66, height: 66, alignment: .center)
                .clipShape(Circle())
                .background(
                    Circle()
                        .fill(.white)
                        .frame(width: 74, height: 74, alignment: .center)
                )
                .background(
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [Color("ColorGreenMedium"), Color("ColorGreenLight")],
                                startPoint: .trailing,
                                endPoint: .leading
                            )
                        )
                        .frame(width: 82, height: 82, alignment: .center)
                )
                .background(
                    Circle()
                        .fill(Color("ColorAppearanceAdaptive"))
                        .frame(width: 90, height: 90, alignment: .center)
                )
                .offset(x: -150)
        }
    }
}

struct FactsView_Previews: PreviewProvider {
    static var previews: some View {
        FactsView(model: factsData[2])
            .previewLayout(.fixed(width: 400, height: 220))
    }
}
