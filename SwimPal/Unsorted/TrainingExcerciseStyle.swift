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
            switch self {
            case .freestyle:
                return Localizable.exercise_style_freestyle
            case .backStroke:
                return Localizable.exercise_style_backStroke
            case .chestStroke:
                return Localizable.exercise_style_chestStroke
            case .butterfly:
                return Localizable.exercise_style_butterfly
            case .dry:
                return Localizable.exercise_style_dry
            case .rest:
                return Localizable.exercise_style_rest
            case .stretching:
                return Localizable.exercise_style_stretching
            case .diving:
                return Localizable.exercise_style_diving
            case .sprint:
                return Localizable.exercise_style_sprint
            }
        }
        
        var valueTitle: String {
            if self == .rest || self == .stretching || self == .diving {
                return Localizable.time
            } else {
                return Localizable.distance
            }
        }
    }
}
