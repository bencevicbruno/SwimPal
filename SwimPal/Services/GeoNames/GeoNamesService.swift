//
//  GeoNamesService.swift
//  SwimPal
//
//  Created by Bruno Benčević on 06.08.2022..
//

import Foundation

final class GeoNamesService: GeoNamesServiceProtocol {
    
    @Dependency(.new) private var dataService: DataServiceProtocol
    
    init() {
    }
    
    func fetchCities(prefixedWith prefix: String, completion: @escaping (Result<GeoNamesResponse, Error>) -> Void) {
        let urlSafePrefix = prefix.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? prefix
        let url = "http://api.geonames.org/searchJSON?name_startsWith=\(urlSafePrefix)&maxRows=10&username=bencevic_bruno"
        
        dataService.fetch(from: url, completion: completion)
    }
}
