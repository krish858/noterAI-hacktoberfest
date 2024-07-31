//
//  SignUpPage.swift
//  noterAI
//
//  Created by Himanshu on 7/30/24.
//

import SwiftUI

struct SignUpPage: View {
    
    @StateObject var vm = viewModel()
    @Binding var showLoginPage: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 20) {
                Spacer()
                
                Text("Sign Up")
                    .foregroundColor(.white)
                    .font(.system(size: 50, weight: .medium, design: .rounded))
                TextField("Username", text: $vm.username)
                    .textFieldStyle(.roundedBorder)
                SecureField("Password", text: $vm.password)
                    .textFieldStyle(.roundedBorder)
                    .privacySensitive()
                
                Button("Don't have an account? Sign up") {
                    withAnimation {
                        showLoginPage = true
                    }
                }
                
                HStack {
                    Spacer()
                    
                    Button("Forgot password?", action: vm.logPressed)
                        .tint(.red.opacity(0.8))
                    Button("SignUp", action: vm.authenticate)
                        .buttonStyle(.bordered)
                    
                    Spacer()
                }
                .alert("Access Denied", isPresented: $vm.invalid) {
                    Button("Dismiss", action: vm.logPressed)
                }
                
                Spacer()
            }
            .frame(width: 300)
            .padding()
            
            Image("login")
                .resizable()
                .cornerRadius(20)
                .ignoresSafeArea()
        }
        .transition(.offset(x: 0, y: 850))
    }
}

#Preview {
    SignUpPage(showLoginPage: .constant(false))
}
