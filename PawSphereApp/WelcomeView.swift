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
                    .foregroundColor(Color(red: 32/255, green: 92/255, blue: 73/255))
                    

            }
        }
    }
}
#Preview{
    WelcomeView()
}
