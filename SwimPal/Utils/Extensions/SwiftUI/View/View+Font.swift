//
//  View+Font.swift
//  SwimPal
//
//  Created by Bruno Benčević on 20.06.2022..
//

import SwiftUI

extension View {
    
    func style(_ font: Font, _ color: UIColor = .black, _ alignment: TextAlignment = .center) -> some View {
        self
            .font(font)
            .foregroundColor(Color(color))
            .multilineTextAlignment(alignment)
    }
}
