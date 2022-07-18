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
        var seconds = miliseconds / 1000
        var minutes = seconds / 60
        let hours = minutes / 60
        
        minutes %= 60
        seconds %= 60
        
        switch format {
        case .hoursMinutes:
            return "\(hours.asTwoDigit):\(minutes.asTwoDigit)h"
        case .minutesSeconds:
            return "\(minutes.asTwoDigit):\(seconds.asTwoDigit)"
        case .hoursMinutesSeconds:
            return "\(hours.asTwoDigit):\(minutes.asTwoDigit):\(seconds.asTwoDigit)"
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
        (miliseconds / 1000) % 60
    }
    
    var minutes: UInt {
        (seconds / 60) % 60
    }
    
    var hours: UInt {
        (minutes / 60) % 24
    }
}
