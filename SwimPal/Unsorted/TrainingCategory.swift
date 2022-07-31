//
//  TrainingCategory.swift
//  SwimPal
//
//  Created by Bruno Benčević on 30.06.2022..
//

import Foundation

extension Training {
    
    enum Category: Identifiable, CaseIterable, Codable {
        case lifeguard
        case everythingX4
        case endurance
        case tooFastForYou
        case randomized
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
            case .randomized:
                return Localizable.training_category_random
            case .custom:
                return Localizable.training_category_custom
            }
        }
        
        var description: String {
            switch self {
            case .lifeguard:
                return Localizable.training_category_lifeguard_description
            case .everythingX4:
                return Localizable.training_category_everything4x_description
            case .endurance:
                return Localizable.training_category_endurance_description
            case .tooFastForYou:
                return Localizable.training_category_tooFastForYou_description
            case .randomized:
                return Localizable.training_category_random_description
            case .custom:
                return Localizable.training_category_custom_description
            }
        }
        
        var imageName: String {
            "image_trainingCategory_\(self)"
        }
        
        var id: Self { self }
    }
}
