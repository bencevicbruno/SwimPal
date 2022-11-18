//
//  View+ClipShape.swift
//  SwimPal
//
//  Created by Bruno Benčević on 16.07.2022..
//

import SwiftUI

extension View {
    
    func clipShape(_ shape: CustomClipShape) -> some View {
        switch shape {
        case .rectangle:
            return self.clipShape(Rectangle()).eraseToAnyView()
        case .roundedRectangle(let cornerRadius):
            return self.clipShape(RoundedRectangle(cornerRadius: cornerRadius)).eraseToAnyView()
        case .circle:
            return self.clipShape(Circle()).eraseToAnyView()
        case .capsule:
            return self.clipShape(Capsule()).eraseToAnyView()
        case .ellipse:
            return self.clipShape(Ellipse()).eraseToAnyView()
        }
    }
}

enum CustomClipShape {
    case rectangle
    case roundedRectangle(_ cornerRadius: CGFloat)
    case circle
    case capsule
    case ellipse
}
