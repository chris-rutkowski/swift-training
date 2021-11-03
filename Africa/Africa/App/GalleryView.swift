//
//  GalleryView.swift
//  Africa
//
//  Created by Chris on 03/11/2021.
//

import SwiftUI

struct GalleryView: View {
    @State private var selectedAnimal: String = "lion"
    
    let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    // Static grid layout
//    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    // Dynamic grid layout
    @State private var gridLayout: [GridItem] = []
    @State private var gridColumnsCount: Double = 3
    
    private func updateGridLayout() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumnsCount))
    }
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 30) {
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 8)
                    )
                
                Slider(value: $gridColumnsCount, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumnsCount) { _ in
                        withAnimation(.easeIn) {
                            updateGridLayout()
                        }
                    }
                
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                                haptics.impactOccurred()
                            }
                    }
                }
                .onAppear {
                    updateGridLayout()
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
