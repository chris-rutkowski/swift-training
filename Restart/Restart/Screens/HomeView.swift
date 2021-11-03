//
//  HomeView.swift
//  Restart
//
//  Created by Chris on 02/11/2021.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingViewActive = false
    @State private var isAnimating = false
    
    var body: some View {
        VStack(spacing: 20) {
            // Header
            Spacer()
            
            ZStack {
                CircleGroupView(color: .gray.opacity(0.1))
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                .padding()
                .offset(y: isAnimating ? 35: -35)
                .animation(
                    .easeInOut(duration: 4).repeatForever(),
                    value: isAnimating
                )
            }
            
            // Center
            
            Text("The time that leads to mastery is dependent on the inensity of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            // Footer
            
            Spacer()
            
            Button(action: {
                withAnimation {
                    isOnboardingViewActive = true
                }
                
            }) {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isAnimating = true
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
