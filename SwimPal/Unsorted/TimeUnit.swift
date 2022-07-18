//
//  TimeUnit.swift
//  SwimPal
//
//  Created by Bruno Benčević on 30.06.2022..
//

import Foundation

extension Time {
    
    enum Unit: UInt {
        case miliseconds = 1
        case seconds = 1_000
        case minutes = 60_000
        case hours = 3_600_000
        
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
