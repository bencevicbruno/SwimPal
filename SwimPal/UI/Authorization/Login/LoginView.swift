//
//  LoginView.swift
//  SwimPal
//
//  Created by Bruno Benčević on 10.06.2022..
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel: LoginViewModel
    
    var body: some View {
        VStack {
            Image(systemName: "person")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            
            emailField
            
            PasswordField(title: Localizable.password, text: $viewModel.password, hidePassword: $viewModel.hidePassword)
            //
            loginButton
            //
            signupMessage
        }
    }
}

private extension LoginView {
    
    var emailField: some View {
        TextField(Localizable.email, text: $viewModel.email)
            .padding(10, .standard)
            .background(RoundedRectangle(cornerRadius: 10)
                .stroke(.gray, lineWidth: 2))
    }
    
    var loginButton: some View {
        Text(Localizable.login)
            .foregroundColor(.white)
            .padding(10, .standard)
            .background(RoundedRectangle(cornerRadius: 10)
                .fill(.blue))
            .onTapGesture {
                viewModel.loginTapped()
            }
    }
    
    var signupMessage: some View {
        Group {
            Text(Localizable.register_msg)
            +
            Text(" ")
            +
            Text(Localizable.register)
                .foregroundColor(.blue)
            
        }
        .contentShape(Rectangle())
        .onTapGesture {
            viewModel.registerTapped()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: .init())
    }
}
