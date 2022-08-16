//
//  TimeUnit.swift
//  SwimPal
//
//  Created by Bruno Benčević on 30.06.2022..
//

import Foundation

extension Time {
    
    enum Unit {
        case miliseconds
        case seconds
        case minutes
        case hours
        
        var inMiliseconds: UInt {
            switch self {
            case .miliseconds:
                return 1
            case .seconds:
                return 1000
            case .minutes:
                return 60 * 1000
            case .hours:
                return 60 * 60 * 1000
            }
        }
        
        func format(_ value: UInt) -> String {
            switch self {
            case .miliseconds:
                return "\(value)ms"
            case .seconds:
                return "\(value)s"
            case .minutes:
                return "\(value)m"
            case .hours:
                return "\(value)h"
            }
        }
    }
}
