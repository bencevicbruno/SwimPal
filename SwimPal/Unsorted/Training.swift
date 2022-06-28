//
//  Training.swift
//  SwimPal
//
//  Created by Bruno Benčević on 22.06.2022..
//

import Foundation

extension Training {
    
    enum Category: Identifiable, CaseIterable {
        case lifeguard
        case everythingX4
        case endurance
        case tooFastForYou
        case random
        case custom
        
        var title: String {
            switch self {
            case .lifeguard:
                return Localizable.training_category_lifeguard
            case .everythingX4:
                return Localizable.training_category_everything4x
            case .endurance:
                return Localizable.training_category_endurance
            case .tooFastForYou:
                return Localizable.training_category_tooFastForYou
            case .random:
                return Localizable.training_category_random
            case .custom:
                return Localizable.training_category_custom
            }
        }
        
        var imageName: String {
            "image_trainingCategory_\(self)"
        }
        
        var id: Self { self }
    }
}
