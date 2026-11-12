//
//  LoginView.swift
//  PawSphereApp
//
//  Created by Maryam Ahmad on 09/11/2026.
//


import SwiftUI
import SwiftData

struct LoginView: View {
@Query private var users: [User]
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State var message: String = ""
    @State private var isLoggedIn = false
    
    let green = Color(red: 0.10, green: 0.35, blue: 0.27)

    var body: some View {

        VStack(spacing: 20) {
            Text("Login")
                .foregroundColor(green)
                .font(.system(.largeTitle, design: .serif))
        
            TextField("Email", text: $email)
                .textInputAutocapitalization(.never)
                .textFieldStyle(.roundedBorder)
                .autocorrectionDisabled()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)
                .padding()

            
            
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
                .padding()
            Button {

                if email.isEmpty || password.isEmpty {

                    message = "Please enter your email and password"

                } else if users.contains(where: {
                    $0.email.lowercased() ==
                    email.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
                    && $0.password == password
                }) {

                    message = ""
                    isLoggedIn = true

                } else {

                    message = "Incorrect email or password"
                }

            } label: {

                Text("Login")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 45)
                    .background(green)
                    .clipShape(Capsule())
            }
            Text(message)
                .foregroundColor(.red)
            HStack {
                Text("Don't have an account? ")
                    .foregroundColor(.gray)
                NavigationLink{
                    SignUpView()
                }label: {
                    Text("Sign up")
                        .font(.headline)
                        .foregroundStyle(.blue)
                        .underline()
                }
            }
            Spacer()

        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color("backgroundColor")
                .ignoresSafeArea()
        )
        .navigationDestination(isPresented: $isLoggedIn){
            MainTabView()
                .navigationBarBackButtonHidden(true)
        }
    }
    func login() {
        let cleanedEmail = email.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        if cleanedEmail.isEmpty || password.isEmpty {
            message = "Please enter your email and password"
        }else if users.contains(where: {
            $0.email.lowercased() == cleanedEmail
            && $0.password == password
        }){
            message = ""
            isLoggedIn = true
        }else{
            message = "Incorrect email or password"
        }
    }
}

#Preview {
    LoginView()
}

