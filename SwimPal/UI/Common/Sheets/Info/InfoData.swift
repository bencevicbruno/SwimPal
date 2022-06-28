//
//  InfoData.swift
//  SwimPal
//
//  Created by Bruno Benčević on 20.06.2022..
//

import SwiftUI

struct InfoData {
    let title: String
    let message: String
    let okTitle: String
    let action: EmptyCallback?
    
    init(title: String, message: String, okTitle: String = Localizable.ok, action: EmptyCallback? = nil) {
        self.title = title
        self.message = message
        self.okTitle = okTitle
        self.action = action
    }
}

extension View {
    
    func infoSheet(_ data: Binding<InfoData?>) -> some View {
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
                InfoSheet(isVisible, data: data)
            }
        }
    }
}
