//
//  UnitSystem.swift
//  SwimPal
//
//  Created by Bruno Benčević on 04.08.2022..
//

import Foundation

enum UnitSystem: Codable, CaseIterable {
    case metric
    case imperial
    
    var title: String {
        switch self {
        case .metric:
            return Localizable.unit_system_metric
        case .imperial:
            return Localizable.unit_system_imperial
        }
    }
}
