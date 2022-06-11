//
//  PasswordField.swift
//  SwimPal
//
//  Created by Bruno Benčević on 10.06.2022..
//

import SwiftUI

struct PasswordField: View {
    
    var title: String
    var text: Binding<String>
    @Binding var hidePassword: Bool
    
    var body: some View {
        HStack {
            if hidePassword {
                SecureField(title, text: text)
                    .padding(.vertical, 10)
                    .padding(.leading, 20)
                    .padding(.trailing, 10)
                    .frame(maxWidth: .infinity)
            } else {
                TextField(title, text: text)
                    .padding(.vertical, 10)
                    .padding(.leading, 20)
                    .padding(.trailing, 10)
                    .frame(maxWidth: .infinity)
            }
            
            Image(systemName: "person")
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
                .onTapGesture {
                    hidePassword.toggle()
                }
                .padding(.trailing, 20)
        }
        .frame(height: 45)
        .background(RoundedRectangle(cornerRadius: 10)
            .stroke(.gray, lineWidth: 2))
    }
}

struct PasswordField_Previews: PreviewProvider {
    static var previews: some View {
        PasswordField(title: "Test", text: .constant("Hello, world!"), hidePassword: .constant(true))
    }
}
