//
//  SPTextField.swift
//  SwimPal
//
//  Created by Bruno Benčević on 20.07.2022..
//

import SwiftUI

struct SPTextField: View {
    
    let title: String?
    let hint: String?
    let height: CGFloat = 60
    
    let validators: [TextFieldValidatorProtocol]
    
    @Binding var text: String
    
    @State private var infoMessage: String?
    @State private var isValid: Bool = true
    
    init(title: String? = nil, hint: String? = nil, _ text: Binding<String>, validators: TextFieldValidatorProtocol) {
        self.title = title
        self.hint = hint
        self._text = text
        self.validators = [validators]
    }
    
    init(title: String? = nil, hint: String? = nil, _ text: Binding<String>, validators: [TextFieldValidatorProtocol] = []) {
        self.title = title
        self.hint = hint
        self._text = text
        self.validators = validators
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            ZStack(alignment: .topLeading) {
                ZStack(alignment: .bottom) {
                    RoundedCorner(radius: 10, corners: [.topLeft, .topRight])
                        .fill(Color.brand)
                    
                    RoundedCorner(radius: 10, corners: [.topLeft, .topRight])
                        .fill(.white)
                        .padding([.top, .horizontal], 2)
                        
                    TextField(hint ?? "", text: $text)
                        .disableAutocorrection(true)
                        .font(.roboto(.headline2))
                        .textFieldStyle(.plain)
                        .frame(height: height - 10)
                        .background(Color.white)
                        .padding(.bottom, 4)
                        .background(borderColor)
                        .padding(.horizontal, 10)
                }
                .frame(height: height)
                .padding(.top, title == nil ? 0 : 12.5)
                
                if let title = title {
                    Text(title)
                        .style(.roboto(.body, .bold), .brand, .leading)
                    .padding(.horizontal, 5)
                    .background(Color.white)
                    .padding(.leading, 10)
                }
            }
            
            if let info = infoMessage {
                Text(info)
                    .style(.roboto(.caption, .regular), .red, .leading)
                    .padding(.horizontal, 10)
            }
        }
        .onChange(of: text) { newText in
            text = newText.trimmingCharacters(in: .whitespaces)
            checkIfValid()
        }
    }
    
    func checkIfValid() {
        for validator in validators {
            if !validator.isValid(text) {
                infoMessage = validator.message
                isValid = false
                return
            }
        }
        
        isValid = true
    }
    
    var borderColor: Color {
        isValid ? .brand : .red
    }
}

struct SPTextField_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            SPTextField(title: "Title", hint: "Hello", .constant(""), validators: [TextFieldValidator.lowerCase])
            
            SPTextField(title: nil, hint: "Hint", .constant(""), validators: [TextFieldValidator.upperCase])
            
            SPTextField(title: "hehe", hint: nil, .constant(""), validators: [TextFieldValidator.number])
        }
        .padding()
    }
}
