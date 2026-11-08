//
//  OnboardingView.swift
//  PawSphereApp
//
//  Created by Maryam Ahmad on 02/11/2026.
//

import SwiftUI

struct OnboardingView: View {
    @State private var goToWelcome = false

    @State private var page = 0

    let images = ["on1", "on2", "on3"]

    let titles = [
        "PawSphere",
        "Care, Connect, Find All in One Place",
        "Better Care, Happier Pets"
    ]

    let green = Color(red: 0.10, green: 0.35, blue: 0.27)
    let cream = Color(red: 1.0, green: 0.98, blue: 0.95)
   

    var body: some View {
        
        NavigationStack{
        GeometryReader { geo in
            
            ZStack {
                cream.ignoresSafeArea()
                
                VStack(spacing: 0) {
                    
                    if page == 0 {
                        
                        HStack {
                            Button("Skip") {
                                page = 2
                            }
                            
                            Spacer()
                            
                            HStack(spacing: 5) {
                                Circle()
                                    .fill(green)
                                    .frame(width: 8, height: 8)
                                
                                Circle()
                                    .stroke(green, lineWidth: 1)
                                    .frame(width: 8, height: 8)
                                
                                Circle()
                                    .stroke(green, lineWidth: 1)
                                    .frame(width: 8, height: 8)
                            }
                            
                            Spacer()
                            
                            Button {
                                page += 1
                            } label: {
                                Image(systemName: "arrow.right.circle")
                                    .font(.system(size: 27))
                            }
                        }
                        .foregroundColor(green)
                        .padding(.horizontal, 25)
                        .padding(.top, 15)
                        
                        Image("paw1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .padding(.top, 15)
                        
                        Text("PawSphere")
                            .font(.system(
                                size: 38,
                                weight: .bold,
                                design: .serif
                            ))
                            .foregroundColor(green)
                        
                        Spacer()
                        
                        Text("All for a Happier Pet Life")
                            .font(.system(size: 18))
                            .foregroundColor(green)
                        
                        Spacer()
                        
                        
                        Image("on1")
                            .resizable()
                            .scaledToFit()
                            .frame(
                                width: geo.size.width,
                                height: geo.size.height * 0.42,
                                alignment: .bottom
                            )
                            .offset(y: geo.safeAreaInsets.bottom)
                        
                        
                    } else {
                        
                        Image(images[page])
                            .resizable()
                            .scaledToFit()
                            .frame(
                                width: geo.size.width,
                                height: geo.size.height * 0.43
                            )
                            .padding(.top, 20)
                        
                        Text(titles[page])
                            .font(.system(
                                size: 28,
                                weight: .regular,
                                design: .serif
                            ))
                            .foregroundColor(green)
                            .multilineTextAlignment(.leading)
                            .frame(
                                maxWidth: .infinity,
                                alignment: .leading
                            )
                            .padding(.horizontal, 24)
                            .padding(.top, 12)
                        
                        Spacer()
                        
                        HStack(spacing: 7) {
                            ForEach(0..<3, id: \.self) { number in
                                Circle()
                                    .fill(
                                        page == number
                                        ? green
                                        : green.opacity(0.25)
                                    )
                                    .frame(width: 8, height: 8)
                            }
                        }
                        
                        if page == 2 {
                            
                            Button {
                                goToWelcome = true
                            } label: {
                                HStack {
                                    Text("Get Started")
                                    Image(systemName: "arrow.right")
                                }
                                .font(.system(
                                    size: 18,
                                    design: .serif
                                ))
                                .foregroundColor(.white)
                                .padding(.horizontal, 25)
                                .frame(height: 42)
                                .background(green)
                                .cornerRadius(25)
                            }
                            .padding(.top, 18)
                            
                        } else {
                            
                            HStack {
                                Button("Skip") {
                                    page = 2
                                }
                                
                                Spacer()
                                
                                Button {
                                    page += 1
                                } label: {
                                    Image(systemName: "arrow.right.circle")
                                        .font(.system(size: 27))
                                }
                            }
                            .foregroundColor(green)
                            .padding(.horizontal, 25)
                            .padding(.top, 35)
                            
                        }
                        
                        Button("Back") {
                            if page > 0 {
                                page -= 1
                            }
                        }
                        .font(.system(
                            size: 17,
                            design: .serif
                        ))
                        .foregroundColor(green)
                        .underline()
                        .padding(.top, 12)
                        
                        Spacer()
                            .frame(height: 25)
                    }
                }
                .frame(
                    width: geo.size.width,
                    height: geo.size.height
                )
            }
        }
    
    }
    }
}

#Preview {
    OnboardingView()
}
