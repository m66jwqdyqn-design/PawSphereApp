//
//  LoginView.swift
//  PawSphereApp
//
//  Created by Maryam Ahmad on 09/11/2026.
//


import SwiftUI

struct LoginView: View {

    let green = Color(red: 0.10, green: 0.35, blue: 0.27)

    var body: some View {

        VStack {

            Text("Login")
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
    LoginView()
}

