//
//  UInt+.swift
//  SwimPal
//
//  Created by Bruno Benčević on 30.06.2022..
//

import Foundation

extension UInt {
    
    var asTwoDigit: String {
        self < 10 ? "0\(self)" : "\(self)"
    }
}
