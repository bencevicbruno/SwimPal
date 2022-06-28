//
//  View+Utils.swift
//  SwimPal
//
//  Created by Bruno Benčević on 11.06.2022..
//

import SwiftUI

extension View {
    
    func removeNavigationBar() -> some View {
        self.navigationTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
    
    func isVisible(_ visible: Bool) -> some View {
        self.opacity(visible ? 1 : 0)
    }
    
    func isHidden(_ hidden: Bool) -> some View {
        self.opacity(hidden ? 0 : 1)
    }
    
    func frame(_ size: CGFloat, alignment: Alignment = .center) -> some View {
        self.frame(width: size, height: size, alignment: alignment)
    }
}
