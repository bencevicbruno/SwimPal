//
//  UIScreen+.swift
//  SwimPal
//
//  Created by Bruno Benčević on 15.06.2022..
//

import UIKit

extension UIScreen {
    
    static var bottomUnsafePadding: CGFloat {
        UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0
    }
    
    static let width = UIScreen.main.bounds.width
    static let height = UIScreen.main.bounds.height
}
