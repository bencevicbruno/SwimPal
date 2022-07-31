//
//  Speed.swift
//  SwimPal
//
//  Created by Bruno Benčević on 22.07.2022..
//

import Foundation

struct Speed {
    private(set) var metersPerSecond: Float
    
    init(_ value: Float, _ unit: Speed.Unit = .metersPerSecond) {
        self.metersPerSecond = abs(value * unit.rawValue)
    }
    
    private init(metersPerSecond: Float) {
        self.metersPerSecond = metersPerSecond
    }
    
    func and(_ value: Float, _ unit: Speed.Unit) -> Speed {
        return Speed(metersPerSecond: self.metersPerSecond + value * unit.rawValue)
    }
    
    func format(in unit: Unit) -> String {
        let value = metersPerSecond * unit.rawValue
        
        switch unit {
        case .metersPerSecond:
            return "\(value) m/s"
        case .kilometersPerSecond:
            return "\(value) km/s"
        }
    }
}

extension Speed {
    
    enum Unit: Float {
        case metersPerSecond = 1
        case kilometersPerSecond = 1000
    }
}
