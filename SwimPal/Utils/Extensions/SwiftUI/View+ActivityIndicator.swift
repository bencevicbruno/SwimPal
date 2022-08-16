//
//  View+ActivityIndicator.swift
//  SwimPal
//
//  Created by Bruno Benčević on 02.08.2022..
//

import SwiftUI

extension View {
    
    func activityIndicator(_ isAnimating: Bool) -> some View {
        ZStack {
            self
            
            if isAnimating {
                ActivityOverlay()
                    .edgesIgnoringSafeArea(.all)
            }
        }
    }
}
