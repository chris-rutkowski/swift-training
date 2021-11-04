//
//  TouchdownApp.swift
//  Touchdown
//
//  Created by Chris on 03/11/2021.
//

import SwiftUI

@main
struct TouchdownApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Shop())
        }
    }
}
