//
//  PasswordField.swift
//  SwimPal
//
//  Created by Bruno Benčević on 10.06.2022..
//

import SwiftUI

struct PasswordField: View {
    
    var title: String
    @Binding var text: String
    @Binding var hidePassword: Bool
    
    var body: some View {
        HStack {
            inputField
                .padding(.vertical, 10)
                .padding(.leading, 20)
                .padding(.trailing, 10)
                .frame(maxWidth: .infinity)
            
            togglePasswordIcon
                .padding(.trailing, 20)
        }
        .frame(height: 50)
        .background(RoundedRectangle(cornerRadius: 10)
            .stroke(Color.brand, lineWidth: 2))
        .foregroundColor(.black)
    }
}

private extension PasswordField {
    
    @ViewBuilder
    var inputField: some View {
        if hidePassword {
            SecureField(title, text: $text)
        } else {
            TextField(title, text: $text)
        }
    }
    
    var togglePasswordIcon: some View {
        Image(systemName: hidePassword ? "eye" : "eye.slash")
            .resizable()
            .scaledToFit()
            .frame(width: 25, height: 25)
            .foregroundColor(.brand)
            .onTapGesture {
                hidePassword.toggle()
            }
    }
}

struct PasswordField_Previews: PreviewProvider {
    static var previews: some View {
        PasswordField(title: "Test", text: .constant("Hello, world!"), hidePassword: .constant(true))
    }
}
