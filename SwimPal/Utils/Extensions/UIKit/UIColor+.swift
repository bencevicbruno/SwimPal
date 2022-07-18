//
//  UIColor+.swift
//  SwimPal
//
//  Created by Bruno Benčević on 20.06.2022..
//

import UIKit

extension UIColor {
    
    static let brand = UIColor(hex: 0x3654B6)
    static let brangLight = UIColor(hex: 0x7287CC)
    
    static let gray142 = UIColor(hex: 0x8E8E8E)
    static let gray242 = UIColor(hex: 0xF2F2F2)
    static let shadow = UIColor.black.withAlphaComponent(0.5)
    
    fileprivate convenience init(hex: Int) {
        self.init(red: Double((hex >> 16) & 0xFF) / 0xFF, green: Double((hex >> 8) & 0xFF) / 0xFF, blue: Double(hex & 0xFF) / 0xFF, alpha: 1)
    }
}
