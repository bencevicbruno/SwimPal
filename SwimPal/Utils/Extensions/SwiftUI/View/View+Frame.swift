//
//  View+Frame.swift
//  SwimPal
//
//  Created by Bruno Benčević on 28.07.2022..
//

import SwiftUI

extension View {
    
    func frame(maxWidth: CGFloat, height: CGFloat) -> some View {
        self.frame(maxWidth: maxWidth)
            .frame(height: height)
    }
}
