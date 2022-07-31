//
//  SheetUtils.swift
//  SwimPal
//
//  Created by Bruno Benčević on 16.07.2022..
//

import SwiftUI

enum SheetUtils {
    
    fileprivate static let animationDuration = 0.3
    
    static func animate(duration: CGFloat = Self.animationDuration, _ action: EmptyCallback, completion: EmptyCallback? = nil) {
        withAnimation(.linear(duration: duration)) {
            action()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            completion?()
        }
    }
    
    static let bottomContentPadding: CGFloat = max(12, UIScreen.bottomUnsafePadding)
    static let horizontalPadding: CGFloat = 12
    
    static let overlayColor = Color(white: 0.3).opacity(0.3)
}
