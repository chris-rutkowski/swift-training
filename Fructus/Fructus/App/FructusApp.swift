//
//  FructusApp.swift
//  Fructus
//
//  Created by Chris on 03/11/2021.
//

import SwiftUI

@main
struct FructusApp: App {
    @AppStorage("isOnboarding") private var isOnboarding = true
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingView()
            } else {
                ContentView()
            }
        }
    }
}
