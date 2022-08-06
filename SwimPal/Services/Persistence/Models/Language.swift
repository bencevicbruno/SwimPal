//
//  Language.swift
//  SwimPal
//
//  Created by Bruno Benčević on 10.06.2022..
//

import Foundation

enum Language: String, Codable, CaseIterable {
    case english = "en"
    case croatian = "hr"
    
    var title: String {
        switch self {
        case .english:
            return Localizable.language_english
        case .croatian:
            return Localizable.language_croatian
        }
    }
}
