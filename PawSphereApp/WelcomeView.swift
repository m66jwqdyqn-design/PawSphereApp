//
//  WelcomeView.swift
//  PawSphereApp
//
//  Created by Maryam Ahmad on 04/11/2026.
//
import SwiftUI

struct WelcomeView: View {
    var body: some View {
      VStack{
            HStack{
                Text("PawSphere")
                    .font(.system(
                        size: 38,
                        weight: .bold,
                        design: .serif
                    ))
    }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("backgroundColor").ignoresSafeArea())
      }
}
#Preview{
    WelcomeView()
}
