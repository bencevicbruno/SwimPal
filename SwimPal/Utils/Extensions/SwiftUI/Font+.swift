//
//  Font+.swift
//  SwimPal
//
//  Created by Bruno Benčević on 20.06.2022..
//

import SwiftUI

extension Font {
    
    static func roboto(_ size: CustomFontSize, _ weight: CustomFontWeight = .regular, italic isItalic: Bool = false) -> Font {
        return Font.custom("Roboto-\(weight.rawValue.capitalized)\(isItalic ? "Italic" : "")", size: CGFloat(size.size))
    }
}

enum CustomFontSize: Int {
    case display1 = 32
    case headline1 = 24
    case headline2 = 20
    case body = 18
    case caption = 16
    case smallCaption = 14
    case label = 12
    
    var size: CGFloat {
        CGFloat(UIScreen.main.bounds.width > 320 ? rawValue : rawValue - 2)
    }
}

enum CustomFontWeight: String {
    case black
    case bold
    case light
    case medium
    case regular
    case thin
}
