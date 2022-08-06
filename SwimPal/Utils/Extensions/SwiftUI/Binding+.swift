//
//  Binding+.swift
//  SwimPal
//
//  Created by Bruno Benčević on 29.07.2022..
//

import SwiftUI

extension Binding where Value == Bool {
    
    static func forVisibility<T>(_ binding: Binding<T?>) -> Binding<Bool> {
        return Binding(
            get: { binding.wrappedValue != nil },
            set: { value in
                if !value {
                    binding.wrappedValue = nil
                }
            }
        )
    }
}
