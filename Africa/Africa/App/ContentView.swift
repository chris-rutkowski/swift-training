//
//  ContentView.swift
//  Africa
//
//  Created by Chris on 03/11/2021.
//

import SwiftUI

struct ContentView: View {
    private let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    private let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isGridViewActive = false
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumnsCount = 1
    @State private var toolbarIcon = "square.grid.2x2"
    
    private func toggleGridLayout() {
        gridLayout = Array(repeating: GridItem(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumnsCount = gridLayout.count
        
        switch gridColumnsCount {
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }

    var body: some View {
        NavigationView {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(animals) { item in
                            NavigationLink(destination: AnimalDetailView(model: item)) {
                                AnimalListItemView(model: item)
                            }
                        }
                        
                        CredtisView()
                            .modifier(CenterModifier())
                    }
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { item in
                                NavigationLink(destination: AnimalDetailView(model: item)) {
                                    AnimalGridItemView(model: item)
                                }
                            }
                        }
                        .padding(10)
                        .animation(.easeIn)
                    }
                }
            }
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        Button(action: {
                            isGridViewActive = false
                            haptics.impactOccurred()
                        }) {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary :  .accentColor)
                        }
                        
                        Button(action: {
                            isGridViewActive = true
                            haptics.impactOccurred()
                            toggleGridLayout()
                        }) {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(!isGridViewActive ? .primary : .accentColor)
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
