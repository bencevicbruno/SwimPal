//
//  View+Padding.swift
//  SwimPal
//
//  Created by Bruno Benčević on 30.05.2022..
//

import SwiftUI

extension View {
    
    func padding(_ padding: CGFloat, _ type: PaddingType = .normal) -> some View {
        self.padding(.vertical, padding)
            .padding(.horizontal, (type == .normal ? 1 : 2) * padding)
    }
}

enum PaddingType {
    case normal
    case standard
}
