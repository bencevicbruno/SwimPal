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
        VStack(spacing: 0) {
            title
                .padding(.top, 10)
            
            Spacer(minLength: 10)
            
            Image("illustration_noInternet")
                .resizable()
                .scaledToFit()
                .padding(.horizontal, 50)
            
            Spacer(minLength: 10)
            
            continueWithGoogleButton
                .padding(.bottom, 10)
        }
        .padding(20)
        .background(.white)
    }
}

private extension LoginView {
    
    var title: some View {
        Text(Localizable.welcome_to)
            .style(.roboto(.display1, .bold), .brand, .center)
    }
    
    var continueWithGoogleButton: some View {
        Text(Localizable.continue_with_google)
            .style(.roboto(.body, .medium), .white)
            .padding(10, .standard)
            .frame(maxWidth: .infinity)
            .frame(height: 60).background(RoundedRectangle(cornerRadius: 10)
                .fill(Color.brand))
            .onTapGesture {
                viewModel.loginTapped()
            }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: .init())
    }
}
