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
        VStack(spacing: 0) {
            Text("PawSphere")
                .font(.system(
                    size: 30,
                    design: .serif))
                .foregroundColor(green)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 35)
        Spacer()
                .frame(height: 65)
            
            
            ZStack{
                Circle()
                    .fill(Color("pawBackgroundColor"))
                    .frame(width: 110, height: 110)
                
                Image(systemName: "pawprint")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 52, height: 52)
                    .foregroundColor(green)
                    
            }
            Text("Every pet belongs")
                .font(.system(size: 28,design: .serif))
                .foregroundColor(green)
                .padding(.top, 25)
            
            Text("Care, services and a helping paw.")
                .font(.system(size: 14,design: .serif))
                .foregroundColor(.gray)
                .padding(.top, 5)
            Spacer()
                .frame(height: 45)
           
            NavigationLink {
                RegisterTabView(selectedTab: 0)
            } label: {
                Text("Create an Account")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 45)
                    .background(green)
                    .clipShape(Capsule())
            }

            NavigationLink{
               RegisterTabView(selectedTab: 1)
            }label: {
                Text("Log In")
                    .foregroundColor(green)
                    .frame(maxWidth: .infinity)
                    .frame(height: 45)
                    .overlay{
                        Capsule()
                            .stroke(green, lineWidth: 1)
                    }
            }
            .padding(.top, 12)
           
            Spacer()

            }
            .padding(.horizontal, 25) // أضيفي هذا السطر
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("backgroundColor")
            .ignoresSafeArea())
        
    }
}
#Preview {
    NavigationStack {
        WelcomeView()
    }
}
