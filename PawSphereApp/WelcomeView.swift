//
//  WelcomeView.swift
//  PawSphereApp
//
//  Created by Maryam Ahmad on 04/11/2026.
//
import SwiftUI

struct WelcomeView: View {
    let green = Color(red: 0.10, green: 0.35, blue: 0.27)
    var body: some View {
      VStack{
            HStack{
                Text("PawSphere")
                    .font(.system(
                        size: 38,
                        weight: .bold,
                        design: .serif))
                    .foregroundColor(green)
    }
          .padding(.top, 100)
            .padding(.bottom, 100)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("backgroundColor").ignoresSafeArea())
      }
}
#Preview{
    WelcomeView()
}
