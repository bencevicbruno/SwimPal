//
//  View+Shadow.swift
//  SwimPal
//
//  Created by Bruno Benčević on 13.07.2022..
//

import SwiftUI

extension View {
    
    @ViewBuilder
    func addShadow(color: Color = .shadow, radius: CGFloat = 10, offset: CGFloat = 0, enabled: Bool = true) -> some View {
        if enabled {
            self.clipped()
                .shadow(color: color, radius: radius, x: 0, y: offset)
        } else {
            self
        }
    }
    
    func addShadow(_ style: ShadowStyle, enabled: Bool = true) -> some View {
        self.addShadow(color: style.color, radius: style.radius, offset: style.offset)
    }
    
    func dropShadow(_ color: Color, size: CGFloat = 8, blurRadius: CGFloat = 16) -> some View {
        self.background(
            color
                .padding(-size)
                .blur(radius: blurRadius)
        )
    }
}

enum ShadowStyle {
    case small
    case medium
    case large
    case custom(Color, CGFloat, CGFloat)
    
    var color: Color {
        switch self {
        case .custom(let color, _, _):
            return color
        default:
            return .shadow
        }
    }
    
    var radius: CGFloat {
        switch self {
        case .custom(_, let radius, _):
            return radius
        default:
            return 5
        }
    }
    
    var offset: CGFloat {
        switch self {
        case .small:
            return 2
        case .medium:
            return 5
        case .large:
            return 10
        case .custom( _, _, let offset):
            return offset
        }
    }
}
