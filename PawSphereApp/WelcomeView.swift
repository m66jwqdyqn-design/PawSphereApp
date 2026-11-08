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
        NavigationStack{
        VStack{
            Text("PawSphere")
                .font(.system(
                    size: 38,
                    weight: .bold,
                    design: .serif
                ))
                .foregroundColor(green)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .padding(.top, 100)
            Spacer()
            ZStack{
                Circle()
                    .fill(Color("backgroundColor"))
                    .frame(width: 140, height: 140)
                Image("pawprint")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 65, height: 65)
                    .foregroundColor(green)
            }
            
        }
    }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("backgroundColor")
            .ignoresSafeArea())
        
    }
}
#Preview{
    WelcomeView()
}
