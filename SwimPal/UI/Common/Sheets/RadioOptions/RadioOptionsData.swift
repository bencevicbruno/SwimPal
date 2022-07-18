//
//  OptionsData.swift
//  SwimPal
//
//  Created by Bruno Benčević on 20.06.2022..
//

import SwiftUI

struct RadioOptionsData {
    let title: String
    let options: [String]
    let action: ((Int) -> Void)?
    
    init(title: String, options: [String], action: ((Int) -> Void)? = nil) {
        self.title = title
        self.options = options
        self.action = action
    }
}

extension View {
    
    func optionsSheet(_ data: Binding<RadioOptionsData?>) -> some View {
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
                RadioOptionsSheet(isVisible, data: data)
            }
        }
    }
}
