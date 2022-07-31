//
//  TrainingLocation.swift
//  SwimPal
//
//  Created by Bruno Benčević on 02.07.2022..
//

import Foundation

extension Training {
    
    struct Location: Codable {
        let latitude: Double?
        let longitude: Double?
        let name: String
        
        init(latitude: Double? = nil, longitude: Double? = nil, name: String) {
            self.latitude = latitude
            self.longitude = longitude
            self.name = name
        }
    }
}

extension Training.Location {
    
    static var osijek: Training.Location {
        Training.Location(latitude: 45.5550, longitude: 18.6955, name: "Osijek")
    }
}
