//
//  Distance.swift
//  SwimPal
//
//  Created by Bruno Benčević on 17.07.2022..
//

import Foundation

struct Distance {
    private(set) var meters: Float
    
    init(_ value: UInt, _ unit: Unit) {
        self.meters = Float(value) * unit.rawValue
    }
    
    init(meters: Float) {
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
        
        func format(amount: Float, shortened: Bool = true) -> String {
            switch self {
            case .meters:
                return shortened ? "\(amount) m" : (amount == 1 ? "\(amount) meter" : "\(amount) meters")
            case .kilometers:
                return shortened ? "\(amount) km" : (amount == 1 ? "\(amount) kilometer" : "\(amount) kilometers")
            }
        }
    }
    
    static let zero = Distance(0, .meters)
}

extension Distance {
    
    static func +(_ lhs: Distance, _ rhs: Distance) -> Distance {
        return Distance(meters: lhs.meters + rhs.meters)
    }
    
    static func +=( _ lhs: inout Distance, _ rhs: Distance) {
        lhs.meters += rhs.meters
    }
}
