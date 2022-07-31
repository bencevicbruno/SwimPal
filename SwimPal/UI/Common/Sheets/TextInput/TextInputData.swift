//
//  TextInputData.swift
//  SwimPal
//
//  Created by Bruno Benčević on 29.07.2022..
//

import SwiftUI

struct TextInputData {
    let title: String
    let description: String?
    let hint: String?
    let text: String?
    let okTitle: String
    let action: ((String) -> Void)?
    
    init(title: String, description: String? = nil, hint: String? = nil, text: String? = nil, okTitle: String = Localizable.ok.uppercased(), action: ((String) -> Void)? = nil) {
        self.title = title
        self.description = description
        self.hint = hint
        self.text = text
        self.okTitle = okTitle
        self.action = action
    }
}

extension View {
    
    func textInputSheet(_ dataBinding: Binding<TextInputData?>) -> some View {
        return ZStack {
            self
            
            if let data = dataBinding.wrappedValue {
                TextInputSheet(.forVisibility(dataBinding), data: data)
            }
        }
    }
}

