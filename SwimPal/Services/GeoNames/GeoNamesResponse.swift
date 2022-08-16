//
//  GeoNamesResponse.swift
//  SwimPal
//
//  Created by Bruno Benčević on 06.08.2022..
//

import Foundation

struct GeoNamesResponse: Codable {
    let geonames: [City]
    
    var locations: [String] {
        Array(Set(geonames.map { $0.name })).sorted()
    }
}

extension GeoNamesResponse {
    
    struct City: Codable {
        let name: String
    }
}
