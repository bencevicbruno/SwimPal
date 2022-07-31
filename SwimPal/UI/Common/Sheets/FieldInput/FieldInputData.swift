//
//  FieldInputData.swift
//  SwimPal
//
//  Created by Bruno Benčević on 20.07.2022..
//

import SwiftUI

struct FieldInputData {
    let title: String
    let description: String?
    let okTitle: String
    let validators: [TextFieldValidatorProtocol]
    let action: ((String) -> Void)?
    
    init(title: String, description: String? = nil, okTitle: String = Localizable.ok.uppercased(), validators: [TextFieldValidatorProtocol] = [], action: ((String) -> Void)? = nil) {
        self.title = title
        self.description = description
        self.okTitle = okTitle
        self.validators = validators
        self.action = action
    }
}

extension View {
    
    func fieldInputSheet(_ data: Binding<FieldInputData?>) -> some View {
        let isVisible = Binding(
            get: { data.wrappedValue != nil },
            set: { value in
                if !value {
                    data.wrappedValue = nil
                }
            }
        )
        
        return ZStack {
            self
            
            if let data = data.wrappedValue {
                FieldInputSheet(isVisible, data: data)
            }
        }
    }
}

