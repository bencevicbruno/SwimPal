//
//  ConfirmationData.swift
//  SwimPal
//
//  Created by Bruno Benčević on 20.06.2022..
//

import SwiftUI

struct ConfirmationData {
    let title: String
    let message: String
    let cancelTitle: String
    let confirmTitle: String
    let action: EmptyCallback?
    
    init(title: String, message: String, cancelTitle: String = Localizable.cancel, confirmTitle: String = Localizable.confirm, action: EmptyCallback? = nil) {
        self.title = title
        self.message = message
        self.cancelTitle = cancelTitle
        self.confirmTitle = confirmTitle
        self.action = action
    }
}

extension View {
    
    func confirmationSheet(_ dataBinding: Binding<ConfirmationData?>) -> some View {
        ZStack {
            self
            
            if let data = dataBinding.wrappedValue {
                ConfirmationSheet(.forVisibility(dataBinding), data: data)
            }
        }
    }
}
