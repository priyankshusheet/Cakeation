//
//  CakeationApp.swift
//  Cakeation
//
//  Created by Priyankshu Sheet on 13/12/24.
//

import SwiftUI

@main
struct CakeationApp: App {
    @StateObject private var cartManager = CartManager()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                OnboardingView()
                ContentView()
                    .environmentObject(cartManager)
            }
        }
    }
}
