//
//  SignUpView.swift
//  PawSphereApp
//
//  Created by Maryam Ahmad on 09/11/2026.
//


import SwiftUI
import SwiftData

struct SignUpView: View {
    @Environment(\.modelContext) private var context
    @Query private var users: [User]

    let green = Color(red: 0.10, green: 0.35, blue: 0.27)

    var body: some View {

        VStack {

            Text("Sign Up")
                .foregroundColor(green)

            Spacer()

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color("backgroundColor")
                .ignoresSafeArea()
        )
    }
}

#Preview {
    SignUpView()
}
