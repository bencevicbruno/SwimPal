//
//  Distance.swift
//  SwimPal
//
//  Created by Bruno Benčević on 17.07.2022..
//

import Foundation

struct Distance {
    let meters: Float
    
    init(_ value: UInt, _ unit: Unit) {
        self.meters = Float(value) * unit.rawValue
    }
    
    private init(meters: Float) {
        self.meters = abs(meters)
    }
    
    func and(_ value: UInt, _ unit: Unit) -> Distance {
        return Distance(meters: self.meters + Float(value) * unit.rawValue)
    }
}

extension Distance {
    
    enum Unit: Float {
        case meters = 1
        case kilometers = 1000
    }
}