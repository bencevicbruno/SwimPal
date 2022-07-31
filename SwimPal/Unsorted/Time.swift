//
//  Time.swift
//  SwimPal
//
//  Created by Bruno Benčević on 30.06.2022..
//

import Foundation

struct Time {
    private(set) var miliseconds: UInt
    
    init(_ value: UInt, _ unit: Time.Unit = .seconds) {
        self.miliseconds = value * unit.rawValue
    }
    
    private init(miliseconds: UInt) {
        self.miliseconds = miliseconds
    }
    
    func and(_ value: UInt, _ unit: Time.Unit) -> Time {
        return Time(miliseconds: self.miliseconds + value * unit.rawValue)
    }
    
    func getFormatted(_ unit: Time.Unit) -> String {
        return unit.format(miliseconds / unit.rawValue)
    }
    
    mutating func add(_ value: UInt, _ unit: Time.Unit) {
        miliseconds += value * unit.rawValue
    }
    
    func getFormatted(with format: Time.Format) -> String {
        switch format {
        case .hoursMinutes:
            return "\(hours.asTwoDigit):\(minutes.asTwoDigit)h"
        case .minutesSeconds:
            return "\(minutes.asTwoDigit):\(seconds.asTwoDigit)"
        case .hoursMinutesSeconds:
            return "\(hours.asTwoDigit):\(minutes.asTwoDigit):\(seconds.asTwoDigit)"
        case .minutes:
            return "\(totalMinutes) min"
        default:
            return "Format not implemented"
        }
    }
    
    static var zero: Time {
        .init(0)
    }
}

extension Time: Codable, Equatable {
    
}

extension Time {
    
    var seconds: UInt {
        totalSeconds % 60
    }
    
    var totalSeconds: UInt {
        miliseconds / 1000
    }
    
    var minutes: UInt {
        totalMinutes % 60
    }
    
    var totalMinutes: UInt {
        seconds / 60
    }
    
    var hours: UInt {
        (minutes / 60) % 24
    }
}
