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
    
    @State private var email: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var passwordConfirmation: String = ""
    @State private var message = ""
    @State private var isRegistered = false
    
    let green = Color(red: 0.10, green: 0.35, blue: 0.27)

    var body: some View {

        VStack(spacing: 20){

            Text("Sign Up")
                .foregroundColor(green)
                .font(.system(.largeTitle, design: .serif))
                .bold()
            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)
                .foregroundColor(.gray)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .keyboardType(.emailAddress)
                .textContentType(UITextContentType.emailAddress)
                .padding()
            
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
                register()
            } label: {
                Text("Create Account")
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 45)
                    .background(green)
                    .clipShape(Capsule())
            }
            Text(message)
                .foregroundColor(
                    isRegistered && !message.isEmpty ? .green : .red
                )
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
        .navigationDestination(isPresented: $isRegistered) {
            MainTabView()
                .navigationBarBackButtonHidden(true)
        }
    }
    func register() {
        let cleanEmail = email.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        let cleanUsername = username.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if cleanEmail.isEmpty || cleanUsername.isEmpty || password.isEmpty
            || passwordConfirmation.isEmpty {
            message = "Please fill in all fields"
            
        }else if !cleanEmail.contains("@") || !cleanEmail.contains(".") {
            message = "Please enter a valid email"
        }else if users.contains(where: {$0.username == cleanUsername}) {
            message = "That username is already taken"
        }
        else{
            let newUser = User(
                email: cleanEmail,
                username: cleanUsername,
                password: password
            )
            context.insert(newUser)
            do {
                try context.save()
                message = "User created successfully"
                isRegistered = true
            } catch {
                message = "Failed to create user: \(error.localizedDescription)"
            }
            }
        }
    }

#Preview {
    NavigationStack{
        SignUpView()
    }
    .modelContainer(for: User.self, inMemory: true)
}
