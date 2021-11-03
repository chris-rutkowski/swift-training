//
//  MapAnnotationView.swift
//  Africa
//
//  Created by Chris on 03/11/2021.
//

import SwiftUI

struct MapAnnotationView: View {
    let location: LocationModel
    @State private var animation: Double = 0
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54, alignment: .center)
            
            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
            
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
            .clipShape(Circle())
        }
        .onAppear {
            withAnimation(.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                animation = 1
            }
        }
    }
}

struct MapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        let locations: [LocationModel] = Bundle.main.decode("locations.json")

        MapAnnotationView(location: locations[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
