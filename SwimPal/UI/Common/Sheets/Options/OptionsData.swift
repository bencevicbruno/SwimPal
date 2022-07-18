//
//  OptionsData.swift
//  SwimPal
//
//  Created by Bruno Benčević on 11.07.2022..
//

import SwiftUI

struct OptionsData {
    let title: String
    let items: [Item]
    let onTapped: ((Int) -> Void)?
    
    init(title: String, items: [Item], onTapped: ((Int) -> Void)? = nil) {
        self.title = title
        self.items = items
        self.onTapped = onTapped
    }
    
    struct Item {
        let iconName: String
        let title: String
    }
}

extension View {
    
    func optionsSheet(_ data: Binding<OptionsData?>) -> some View {
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
                OptionsSheet(isVisible, data: data)
            }
        }
    }
}
