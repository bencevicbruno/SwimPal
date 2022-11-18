//
//  View+SwimPal.swift
//  SwimPal
//
//  Created by Bruno Benčević on 28.07.2022..
//

import SwiftUI

extension View {
    
    func setupView() -> some View {
        self.removeNavigationBar()
            .background(Color.white)
            .preferredColorScheme(.light)
    }
}
