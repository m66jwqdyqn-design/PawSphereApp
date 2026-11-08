//
//  R registerTapView.swift
//  PawSphereApp
//
//  Created by Maryam Ahmad on 09/11/2026.
//


import SwiftUI

struct RegisterTabView: View {
    @State var selectedTab: Int = 0
    let green = Color(red: 0.10, green: 0.35, blue: 0.27)

    var body: some View {

        VStack(spacing: 25){
            Picker("Acount", selection: $selectedTab){
                Text("Login").tag(0)
                Text("Sign Up").tag(1)
            }
            .pickerStyle(.segmented)
            .padding(.horizontal, 20)
            
            if selectedTab == 0 {
                LoginView()
            } else {
                SignUpView()
            }
            Spacer()

        }
        .background(
            Color("backgroundColor")
                .ignoresSafeArea()
        )
    }
}

#Preview {
    RegisterTabView()
}
