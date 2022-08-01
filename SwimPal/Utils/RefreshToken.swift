//
//  RefreshToken.swift
//  SwimPal
//
//  Created by Bruno Benčević on 01.08.2022..
//

import Foundation

typealias RefreshToken = Bool

extension RefreshToken {
    
    init() {
        self = true
    }
    
    mutating func refresh() {
        self.toggle()
    }
}
