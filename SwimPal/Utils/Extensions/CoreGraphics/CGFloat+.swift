//
//  CGFloat+.swift
//  SwimPal
//
//  Created by Bruno Benčević on 26.07.2022..
//

import CoreGraphics

extension CGFloat {
    
    static func *(_ integer: Int, _ float: CGFloat) -> CGFloat {
        return CGFloat(integer) * float
    }
}

