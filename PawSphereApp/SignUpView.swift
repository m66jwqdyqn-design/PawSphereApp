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
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var passwordConfirmation: String = ""
    
    @State private var message = ""

    let green = Color(red: 0.10, green: 0.35, blue: 0.27)

    var body: some View {

        VStack {

            Text("Sign Up")
                .foregroundColor(green)
                .font(.system(.largeTitle, design: .serif))
                .bold()
            
            TextField("Username", text: $username)
                .textFieldStyle(.roundedBorder)
                .foregroundColor(.gray)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .padding()
            
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
                .foregroundColor(green)
                .padding()
            
            SecureField("Confirm Password", text: $passwordConfirmation)
                .textFieldStyle(.roundedBorder)
                .foregroundColor(green)
                .padding()
            Button {
                if username.isEmpty || password.isEmpty || passwordConfirmation.isEmpty {
                    message = "Please fill in all fields"
                } else if password != passwordConfirmation {
                    message = "Passwords do not match"
                }else if users.contains(where: { $0.username == username }) {
                    message = "Username already taken"
                }else {
                    let newUser = User(username: username, password: password)
                    context.insert(newUser)
                    do {
                        try context.save()
                        message = "Account created successfully"
                    }catch {
                        message = "Could not create account"
                    }
                    
                }
            } label: {
                Text("Create Account")
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 45)
                    .background(green)
                    .clipShape(Capsule())
            }
            Text(message)
                .foregroundColor(green)
            HStack{
                Text("Already have an account?")
                    .foregroundColor(.gray)
                NavigationLink(destination: LoginView()) {
                    Text("Login here")
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
    }
}

#Preview {
    SignUpView()
}
