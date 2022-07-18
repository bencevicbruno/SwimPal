//
//  ValuePickerData.swift
//  SwimPal
//
//  Created by Bruno Benčević on 17.07.2022..
//

import SwiftUI

struct ValuePickerData<T: Hashable> {
    let title: String
    let description: String?
    let items: [ValuePickerSheetItem<T>]
    let okTitle: String
    let cancelTitle: String
    let action: ((T) -> Void)?
    
    init(title: String, description: String? = nil, items: [ValuePickerSheetItem<T>], okTitle: String = Localizable.ok, cancelTitle: String = Localizable.cancel, action: ((T) -> Void)? = nil) {
        self.title = title
        self.description = description
        self.items = items
        self.okTitle = okTitle
        self.cancelTitle = cancelTitle
        self.action = action
    }
}

extension View {
    
    func valuePickerSheet<T>(_ data: Binding<ValuePickerData<T>?>) -> some View where T: Hashable {
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
                ValuePickerSheet<T>(isVisible, data: data)
            }
        }
    }
}
