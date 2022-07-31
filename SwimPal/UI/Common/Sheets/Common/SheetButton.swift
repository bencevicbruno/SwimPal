//
//  SheetButton.swift
//  SwimPal
//
//  Created by Bruno Benčević on 16.07.2022..
//

import SwiftUI

struct SheetButton: View {
    
    private let title: String
    private let style: Style
    private let isEnabled: Bool
    private let action: EmptyCallback?
    
    init(_ title: String, style: Style = .primary, isEnabled: Bool = true, _ action: EmptyCallback? = nil) {
        self.title = title
        self.style = style
        self.isEnabled = isEnabled
        self.action = action
    }
    
    var body: some View {
        Text(title.uppercased())
            .style(.roboto(.body, .bold), style.foregroundColor, .center)
            .frame(height: Self.height)
            .frame(maxWidth: .infinity).background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(style.backgroundColor)
            )
            .contentShape(RoundedRectangle(cornerRadius: 10))
            .onTapGesture {
                action?()
            }
    }
    
    static let height: CGFloat = 60
}

extension SheetButton {
    
    enum Style {
        case primary
        case secondary
        
        var foregroundColor: UIColor {
            switch self {
            case .primary:
                return .white
            case .secondary:
                return .black
            }
        }
        
        var backgroundColor: Color {
            switch self {
            case .primary:
                return .brand
            case .secondary:
                return .gray242
            }
        }
    }
}

struct SheetButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SheetButton("OK")
            
            SheetButton("Cancel", style: .secondary)
        }
    }
}
