//
//  TrainingExcerciseStyle.swift
//  SwimPal
//
//  Created by Bruno Benčević on 30.06.2022..
//

import Foundation

extension Training.Excercise {
    
    enum Style: CaseIterable, Codable {
        case freestyle
        case backStroke
        case chestStroke
        case butterfly
        case dry
        case rest
        case stretching
        case diving
        case sprint
        
        var countsAsSwimming: Bool {
            return self != .rest && self != .diving && self != .stretching
        }
        
        var isMeasuredInMeters: Bool {
            countsAsSwimming || self == .diving
        }
        
        var unit: String {
            self == .rest || self == .stretching ? "min" : "m"
        }
        
        var title: String {
            "\(self)"
        }
        
        var valueTitle: String {
            if self == .rest || self == .stretching || self == .diving {
                return "Time"
            } else {
                return "Distance"
            }
        }
    }
}
