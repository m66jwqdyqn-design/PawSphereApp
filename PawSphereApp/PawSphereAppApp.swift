//
//  PawSphereAppApp.swift
//  PawSphereApp
//
//  Created by Maryam Ahmad on 15/10/2026.
//

import SwiftUI
import SwiftData
@main
struct PawSphereAppApp: App {
    var body: some Scene {
        WindowGroup {
            OnboardingView()
        }
        .modelContainer(for: User.self)
    }
}
