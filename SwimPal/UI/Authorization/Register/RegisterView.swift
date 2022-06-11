//
//  RegisterView.swift
//  SwimPal
//
//  Created by Bruno Benčević on 10.06.2022..
//

import SwiftUI

struct RegisterView: View {
    
    @ObservedObject var viewModel: RegisterViewModel
    
    var body: some View {
        VStack {
            navigationBar
            
            Image(systemName: "person")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            emailField
            
            PasswordField(title: Localizable.password, text: $viewModel.password, hidePassword: $viewModel.hidePassword)
            
            PasswordField(title: Localizable.repeat_password, text: $viewModel.passwordRepeated, hidePassword: $viewModel.hidePassword)
            
            registerButton
        }
        .removeNavigationBar()
    }
    
    init(viewModel: RegisterViewModel) {
        self.viewModel = viewModel
        print("hello?")
    }
}

private extension RegisterView {
    
    var navigationBar: some View {
        HStack {
            Image(systemName: "person")
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
                .onTapGesture {
                    viewModel.dismiss()
                }
            
            Spacer()
        }
        .frame(height: 40)
    }
    
    var emailField: some View {
        TextField(Localizable.email, text: $viewModel.email)
            .padding(10, .standard)
            .background(RoundedRectangle(cornerRadius: 10)
                .stroke(.gray, lineWidth: 2))
    }
    
    var registerButton: some View {
        Text(Localizable.register)
            .foregroundColor(.white)
            .padding(10, .standard)
            .background(RoundedRectangle(cornerRadius: 10)
                .fill(.blue))
            .onTapGesture {
                viewModel.registerTapped()
            }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(viewModel: .init())
    }
}
